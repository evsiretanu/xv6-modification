#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

#ifdef CS333_P2
#include "uproc.h"
#endif

#ifdef CS333_P3P4

struct StateLists {
  struct proc* ready[MAX+1];
  struct proc* free;
  struct proc* sleep;
  struct proc* zombie;
  struct proc* running;
  struct proc* embryo;
};

#endif

struct {
  struct spinlock lock;
  struct proc proc[NPROC];

#ifdef CS333_P3P4
  struct StateLists pLists;
  uint PromoteAtTime;     // time when to promote all procs
#endif

} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);
static void wakeup1(void *chan);

#ifdef CS333_P3P4
static struct proc* popStateList(struct proc**);
static struct proc* popStateList2(struct proc**, enum procstate);

static int addToStateListEnd(struct proc**, struct proc*);
static void addToStateListEnd2(struct proc**, struct proc*, enum procstate);

static int addToStateListHead(struct proc**, struct proc*);
static void addToStateListHead2(struct proc**, struct proc*, enum procstate);

static int removeFromStateList(struct proc**, struct proc*);
static void removeFromStateList2(struct proc**, struct proc*, enum procstate);

static void removeFromReadyList(struct proc**, struct proc*, int);

static int stateEqual(struct proc*, enum procstate);
static void promoteprocs(void);
static void demoteproc(struct proc*);
#endif

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  #ifndef CS333_P3P4
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;
  #else
  if((p = popStateList2(&ptable.pLists.free, UNUSED)) != 0)
    goto found;
  #endif
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;

  #ifdef CS333_P3P4
  addToStateListHead2(&ptable.pLists.embryo, p, EMBRYO);
  #endif
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    #ifdef CS333_P3P4
    // Remove from embryo list if out of memory
    acquire(&ptable.lock);
    removeFromStateList2(&ptable.pLists.embryo, p, EMBRYO);
    p->state = UNUSED;
    addToStateListHead2(&ptable.pLists.free, p, UNUSED);
    release(&ptable.lock);
    #else
    p->state = UNUSED;
    #endif

    return 0;
  }

  sp = p->kstack + KSTACKSIZE;
  
  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;
  
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  p->start_ticks = ticks;

  #ifdef CS333_P2
  p->cpu_ticks_in = 0;
  p->cpu_ticks_total = 0;
  #endif
  #ifdef CS333_P3P4
  p->prio = 0;
  p->budget = BUDGET;
  #endif
  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  #ifdef CS333_P3P4
  acquire(&ptable.lock);
  ptable.pLists.free    = 0;
  ptable.pLists.sleep   = 0;
  ptable.pLists.zombie  = 0;
  ptable.pLists.running = 0;
  ptable.pLists.embryo  = 0;

  // Initialize ready list
  for (int i = 0; i < MAX+1; i++) {
    ptable.pLists.ready[i] = 0;
  }

  // Initialize the next pointers in proc array
  for (int i = 0; i < NPROC - 1; i++) {
    ptable.proc[i].next = &ptable.proc[i+1];
  }
  ptable.proc[NPROC-1].next = 0;        // Set last one -> next to NULL

  ptable.pLists.free = ptable.proc;   // Make free list be the head of proc list
  ptable.PromoteAtTime = TICKS_TO_PROMOTE;  // promote time
  release(&ptable.lock);
  #endif

  p = allocproc();
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  #ifdef CS333_P2
  // Set the uid and gid to default
  p->uid = DEFUID;
  p->gid = DEFGID;
  #endif

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  #ifdef CS333_P3P4
  acquire(&ptable.lock);
  removeFromStateList2(&ptable.pLists.embryo, p, EMBRYO);
  p->state = RUNNABLE;
  addToStateListHead2(&ptable.pLists.ready[p->prio], p, RUNNABLE);  // Ready list is empty before this. p->prio == 0
  release(&ptable.lock);
  #else
  p->state = RUNNABLE;
  #endif
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  
  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

#ifndef CS333_P3P4
int
fork(void)
{
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0)
    return -1;

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);

  safestrcpy(np->name, proc->name, sizeof(proc->name));
 
  pid = np->pid;

  #ifdef CS333_P2
  // Copy the uid and the gid of the parent
  np->uid = proc->uid;
  np->gid = proc->gid;
  #endif

  // lock to force the compiler to emit the np->state write last.
  acquire(&ptable.lock);
  np->state = RUNNABLE;
  release(&ptable.lock);
  
  return pid;
}

#else

int
fork(void)
{
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0)
    return -1;

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
    acquire(&ptable.lock);
    np->kstack = 0;

    // Move proc back to unused if there is not enough memory
    removeFromStateList2(&ptable.pLists.embryo, np, EMBRYO);
    np->state = UNUSED;
    addToStateListHead2(&ptable.pLists.free, np, UNUSED);
    release(&ptable.lock);
    return -1;
  }
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);

  safestrcpy(np->name, proc->name, sizeof(proc->name));

  pid = np->pid;

  // Copy the uid and the gid of the parent. This is P2 functionality.
  // CS333_P3P4 also includes CS333_P2 flag.
  np->uid = proc->uid;
  np->gid = proc->gid;

  // lock to force the compiler to emit the np->state write last.
  acquire(&ptable.lock);
  removeFromStateList2(&ptable.pLists.embryo, np, EMBRYO);
  np->state = RUNNABLE;
  addToStateListEnd2(&ptable.pLists.ready[np->prio], np, RUNNABLE);  // New proc gets highest priority. np->prio == 0
  release(&ptable.lock);

  return pid;
}
#endif

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
#ifndef CS333_P3P4
void
exit(void)
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(proc->cwd);
  end_op();
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}
#else
void
exit(void)
{
  // Make an array of addresses for the state lists. This is used in order
  // to not have duplicate code for iterating over each one individually.
  // Lock not needed here since addresses of variables do not change
  struct proc **stateLists[] = {&ptable.pLists.sleep, &ptable.pLists.running,
                                &ptable.pLists.zombie};
  struct proc *p;
  int fd;
  int slsize = sizeof(stateLists)/ sizeof(stateLists[0]);

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(proc->cwd);
  end_op();
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  // Iterate over ready lists
  for(int i = 0; i < MAX+1; i++) {
    p = ptable.pLists.ready[i];
    while(p) {
      if(p->parent == proc) {
        p->parent = initproc;
      }
      p = p->next;
    }
  }

  // Iterate over sleep, running, zombie
  for (int i = 0; i < slsize; i++) {
    p = *stateLists[i];  //p = head of a state list
    while(p) {
      if(p->parent == proc) {
        p->parent = initproc;
        if(p->state == ZOMBIE)
          wakeup1(initproc);
      }
      p = p->next;
    }
  }

  // Remove proc from running list
  removeFromStateList2(&ptable.pLists.running, proc, RUNNING);
  proc->state = ZOMBIE;
  addToStateListHead2(&ptable.pLists.zombie, proc, ZOMBIE);
  // Jump into the scheduler, never to return.
  sched();
  panic("zombie exit");

}
#endif

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
#ifndef CS333_P3P4
int
wait(void)
{
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->state = UNUSED;
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
#else
int
wait(void)
{
  // Make an array of addresses for the state lists. This is used in order
  // to not have duplicate code for iterating over each one individually.
  struct proc **stateLists[] = {&ptable.pLists.sleep, &ptable.pLists.running};
  struct proc *p;
  int slsize = sizeof(stateLists)/ sizeof(stateLists[0]);
  int havekids, pid;

  acquire(&ptable.lock);
  for(;;) {
    havekids = 0;

    // Iterate over zombie list
    for (p = ptable.pLists.zombie; p; p = p->next) {
      if(p->parent == proc) {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;

        // Remove from zombie list
        removeFromStateList2(&ptable.pLists.zombie, p, ZOMBIE);
        p->state = UNUSED;
        addToStateListHead2(&ptable.pLists.free, p, UNUSED);
        release(&ptable.lock);
        return pid;
      }
    }

    // Iterate over ready lists
    for (int i = 0; i < MAX+1; i++) {
      p = ptable.pLists.ready[i];
      while(p) {
        if(p->parent == proc) {
          havekids = 1;
          break;
        }
        p = p->next;
      }
    }

    // Iterate over sleeping and running lists
    // Skip if kids have already been found
    if(!havekids) {
      for (int i = 0; i < slsize; i++) {
        p = *stateLists[i];  //p = head of a state list
        while (p) {
          if (p->parent == proc) {
            havekids = 1;
            break;
          }
          p = p->next;
        }
      }
    }


    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
#endif

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
#ifndef CS333_P3P4
// original xv6 scheduler. Use if CS333_P3P4 NOT defined.
void
scheduler(void)
{
  struct proc *p;
  int idle;  // for checking if processor is idle

  for(;;){
    // Enable interrupts on this processor.
    sti();

    idle = 1;  // assume idle unless we schedule a process
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      idle = 0;  // not idle this timeslice
      proc = p;
      switchuvm(p);
      p->state = RUNNING;

      #ifdef CS333_P2
      p->cpu_ticks_in = ticks;
      #endif

      swtch(&cpu->scheduler, proc->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
    // if idle, wait for next interrupt
    if (idle) {
      sti();
      hlt();
    }
  }
}

#else
void
scheduler(void)
{
  struct proc *p;
  int idle;  // for checking if processor is idle

  for(;;){
    // Enable interrupts on this processor.
    sti();

    idle = 1;  // assume idle unless we schedule a process
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    if(ticks >= ptable.PromoteAtTime) {
      promoteprocs();
      ptable.PromoteAtTime = ticks + TICKS_TO_PROMOTE;
    }

    for(int i = 0; i < MAX+1; i++) {
      if ((p = popStateList2(&ptable.pLists.ready[i], RUNNABLE))) {
        if(p->prio != i)
          panic("scheduler: The prio of the the removed proc is different from the expected");

        // Switch to chosen process.  It is the process's job
        // to release ptable.lock and then reacquire it
        // before jumping back to us.
        idle = 0;  // not idle this timeslice
        proc = p;
        switchuvm(p);
        p->state = RUNNING;
        p->cpu_ticks_in = ticks;
        addToStateListHead2(&ptable.pLists.running, p, RUNNING);

        swtch(&cpu->scheduler, proc->context);
        switchkvm();

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        proc = 0;
        break;
      }
    }
    release(&ptable.lock);
    // if idle, wait for next interrupt
    if (idle) {
      sti();
      hlt();
    }
  }
}
#endif

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
#ifndef CS333_P3P4
void
sched(void)
{
  int intena;
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;

  #ifdef CS333_P2
  proc->cpu_ticks_total += (ticks - proc->cpu_ticks_in);   // Update total cpu time
  #endif

  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
}
#else
void
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;

  // P2 functionality. CS333_P3P4 includes P2. No conditional check needed.
  proc->cpu_ticks_total += (ticks - proc->cpu_ticks_in);   // Update total cpu time

  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
}
#endif

// Give up the CPU for one scheduling round.

#ifndef CS333_P3P4
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  proc->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

#else

void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock

  // Remove from running list
  removeFromStateList2(&ptable.pLists.running, proc, RUNNING);
  proc->state = RUNNABLE;
  proc->budget -= (ticks - proc->cpu_ticks_in);   // Update budget
  demoteproc(proc);                               // Demote if necessary
  addToStateListEnd2(&ptable.pLists.ready[proc->prio], proc, RUNNABLE);
  sched();
  release(&ptable.lock);
}
#endif

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot 
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }
  
  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
// 2016/12/28: ticklock removed from xv6. sleep() changed to
// accept a NULL lock to accommodate.

#ifndef CS333_P3P4
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){
    acquire(&ptable.lock);
    if (lk) release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
  proc->state = SLEEPING;
  sched();

  // Tidy up.
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){ 
    release(&ptable.lock);
    if (lk) acquire(lk);
  }
}

#else

void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){
    acquire(&ptable.lock);
    if (lk) release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
  removeFromStateList2(&ptable.pLists.running, proc, RUNNING);
  proc->state = SLEEPING;
  proc->budget -= (ticks - proc->cpu_ticks_in); // Update budget
  demoteproc(proc);                             // Demote if necessary
  addToStateListHead2(&ptable.pLists.sleep, proc, SLEEPING);
  sched();

  // Tidy up.
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){
    release(&ptable.lock);
    if (lk) acquire(lk);
  }
}

#endif



//PAGEBREAK!
#ifndef CS333_P3P4
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}
#else
static void
wakeup1(void *chan)
{
  // The lock was aquired in wakeup()
  struct proc* p = ptable.pLists.sleep;
  struct proc* runble;

  // Remove from sleeping list and add to running
  while(p) {
    if(p->chan == chan) {
      runble = p;
      p = p->next;
      removeFromStateList2(&ptable.pLists.sleep, runble, SLEEPING);
      runble->state = RUNNABLE;
      addToStateListEnd2(&ptable.pLists.ready[runble->prio], runble, RUNNABLE);
    }
    else {
      p = p->next;
    }
  }
}
#endif

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
#ifndef CS333_P3P4
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
#else
int
kill(int pid)
{
  // List of state lists over which to look for the process
  struct proc **stateLists[] = {&ptable.pLists.sleep, &ptable.pLists.running,
                                &ptable.pLists.zombie};
  struct proc *p;
  int slsize = sizeof(stateLists)/ sizeof(stateLists[0]);

  acquire(&ptable.lock);

  // Iterate over ready lists
  for (int i = 0; i < MAX; i++) {
    p = ptable.pLists.ready[i];
    while(p) {
      if(p->pid == pid) {
        // Reset process priority to make sure it gets killed as fast as possible
        removeFromReadyList(&ptable.pLists.ready[i], p, i);
        p->killed = 1;
        p->prio = 0;
        addToStateListEnd2(&ptable.pLists.ready[p->prio], p, RUNNABLE);
        release(&ptable.lock);
        return 0;
      }
      p = p->next;
    }
  }

  // Iterate over sleeping, zombie, running lists
  for (int i = 0; i < slsize; i++) {
    p = *stateLists[i];  //p = head of a state list
    while(p) {
      if(p->pid == pid) {
        p->killed = 1;
        p->prio = 0;          // Reset process priority to make sure it gets killed as fast as possible
        // Wake process from sleep if necessary.
        if(p->state == SLEEPING) {
          removeFromStateList2(&ptable.pLists.sleep, p, SLEEPING);
          p->state = RUNNABLE;
          addToStateListEnd2(&ptable.pLists.ready[p->prio], p, RUNNABLE);
        }
        release(&ptable.lock);
        return 0;
      }
      p = p->next;
    }
  }

  release(&ptable.lock);
  return -1;
}
#endif

static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
};

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  #ifdef CS333_P1
  int elaps, elaps_1, elaps_10, elaps_100, elaps_1000;
    #ifdef CS333_P2
      int ppid, cputick_1, cputick_10, cputick_100, cputick_1000;
      #ifndef CS333_P3P4
        cprintf("\nPID\tName\tUID\tGID\tPPID\tElapsed\tCPU\tState\tSize\t PCs\n");    // P2
      #else
        cprintf("\nPID\tName\tUID\tGID\tPPID\tPrio\tElapsed\tCPU\tState\tSize\t PCs\n");    // P4
      #endif
    #else
      cprintf("\nPID\tState\tName\tElapsed\t PCs\n");                              // P1
    #endif
  #endif


  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";

    #if(!defined CS333_P2)
    cprintf("%d\t%s\t%s", p->pid, state, p->name);     // Print this for P0 and P1
    #endif

    #ifdef CS333_P1
      elaps       = (ticks - p->start_ticks);
      elaps_1     = elaps/1000;     // Seconds
      elaps_10    = (elaps/100)%10; // 10th of a second
      elaps_100   = (elaps/10)%10;  // 100th of a second
      elaps_1000  = (elaps%10);     // 1000th of a second

    #ifdef CS333_P2
      cputick_1    = p->cpu_ticks_total/1000;       // CPU time in seconds
      cputick_10   = (p->cpu_ticks_total/100)%10;  // CPU time in 10th of a second
      cputick_100  = (p->cpu_ticks_total/10)%10;
      cputick_1000 = (p->cpu_ticks_total%10); 
      // Get parent pid
      if(p->parent)
        ppid = p->parent->pid;
      else
        ppid = initproc->pid;


    #ifndef CS333_P3P4
    // P2
    cprintf("%d\t%s\t%d\t%d\t%d\t%d.%d%d%d\t%d.%d%d%d\t%s\t%d", p->pid, p->name, p->uid, p->gid, ppid,
              elaps_1, elaps_10, elaps_100, elaps_1000, cputick_1, cputick_10, cputick_100, cputick_1000, state, p->sz);
    #else
    // P4
    cprintf("%d\t%s\t%d\t%d\t%d\t%d\t%d.%d%d%d\t%d.%d%d%d\t%s\t%d", p->pid, p->name, p->uid, p->gid, ppid, p->prio,
              elaps_1, elaps_10, elaps_100, elaps_1000, cputick_1, cputick_10, cputick_100, cputick_1000, state, p->sz);
    #endif

    #else
    // P1
      cprintf("\t%d.%d%d%d", elaps_1, elaps_10, elaps_100, elaps_1000);
    #endif
    #endif


    if(p->state == SLEEPING){
      cprintf("\t");
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}


#ifdef CS333_P2
int
getuprocs(int max, struct uproc *procs) {
  int size = 0;
  struct proc *p;

  if(max < 0)
    return -1;

  acquire(&ptable.lock);  // Lock ptable so nothing else uses it
  for(p = ptable.proc; p < &ptable.proc[NPROC] && size < max; p++){
    if(p->state != EMBRYO && p->state != UNUSED) {
      procs->pid = p->pid;
      procs->uid = p->uid;
      procs->gid = p->gid;
      if(p->parent)
        procs->ppid = p->parent->pid;
      else
        procs->ppid = initproc->pid;
      procs->elapsed_ticks = ticks - p->start_ticks;
      procs->CPU_total_ticks = p->cpu_ticks_total;
      procs->prio = p->prio;
      procs->size = p->sz;
      safestrcpy(procs->state, states[p->state], sizeof(procs->state));
      safestrcpy(procs->name, p->name, sizeof(procs->name));
      size++;
      procs++;
    }
  }
  release(&ptable.lock);
  return size;
}
#endif

#ifdef CS333_P3P4

int
setpriority(int pid, int prio) {
  struct proc *p;
  struct proc **stateLists[] = {&ptable.pLists.sleep, &ptable.pLists.running};
  int slsize = sizeof(stateLists)/sizeof(stateLists[0]);

  if(prio < 0 || prio > MAX || pid < 0 || pid > 32767)
    return -1;

  acquire(&ptable.lock);

  // Loop over ready lists
  for(int i = 0; i < MAX+1; i++) {
    p = ptable.pLists.ready[i];
    while(p) {
      if(p->pid == pid) {
        if(p->prio != prio) {
          removeFromReadyList(&ptable.pLists.ready[i], p, i);
          p->prio = prio;
          p->budget = BUDGET;
          addToStateListEnd2(&ptable.pLists.ready[p->prio], p, RUNNABLE);
        }
        release(&ptable.lock);
        return 0;
      }
      p = p->next;
    }
  }

  // Loop over sleep and running lists
  for(int i = 0; i < slsize; i++) {
    p = *stateLists[i];
    while(p) {
      if(p->pid == pid) {
        if(p->prio != prio) {
          p->prio = prio;
          p->budget = BUDGET;
        }
        release(&ptable.lock);
        return 0;
      }
      p = p->next;
    }
  }

  release(&ptable.lock);
  return -1;
}

// The ptable lock must be acquired before calling this function
static void
promoteprocs(void) {
  struct proc **stateLists[] = {&ptable.pLists.sleep, &ptable.pLists.running};
  struct proc *p, *curr;
  int slsize = sizeof(stateLists)/ sizeof(stateLists[0]);


  // Reset the budget in the highest priority queue
  p = ptable.pLists.ready[0];
  while(p) {
    p->budget = BUDGET;
    p = p->next;
  }
  
  for(int i = 1; i < MAX+1 ; i++) {
    curr = ptable.pLists.ready[i];
    while(curr) {
      p = curr;
      curr = curr->next;
      removeFromReadyList(&ptable.pLists.ready[i], p, i);
      p->prio--;
      p->budget = BUDGET;
      addToStateListEnd2(&ptable.pLists.ready[p->prio], p, RUNNABLE);
    }
  }

  // Loop over sleeping and running lists
  for(int i = 0; i < slsize; i++) {
    curr = *stateLists[i];
    while(curr) {
      if(curr->prio > 0) {
        curr->prio--;
        curr->budget = BUDGET;
      }
      curr = curr->next;
    }
  }
}


static void
demoteproc(struct proc *proc) {
  // Reset budget
  if(proc->budget <= 0) {
    proc->budget = BUDGET;

    // Adjust proc priority, if needed
    if (proc->prio != MAX)
      proc->prio++;
  }

}


// Print the PIDs of sleeping processes
void
dumpsleep(void) {
  struct proc *p;

  acquire(&ptable.lock);
  cprintf("\nSleep List Processes:\n");
  p = ptable.pLists.sleep;
  if(!p) {
    cprintf("There are no processes in the list.\n");
    release(&ptable.lock);
    return;
  }
  while(p->next) {
    cprintf("%d -> ", p->pid);
    p = p->next;
  }
  cprintf("%d\n", p->pid);
  release(&ptable.lock);
}

// Print the PIDs of runnable processes
void
dumpready(void) {
  struct proc *p;

  acquire(&ptable.lock);
  cprintf("\nReady List Processes:");

  for(int i = 0; i < MAX+1; i++) {
    cprintf("\n%d: ", i);
    p = ptable.pLists.ready[i];
    while(p) {
      cprintf("(%d,%d)", p->pid, p->budget);
      if(p->next){
        cprintf(" -> ");
      }
      p = p->next;
    }
    cprintf("\n");
  }
  release(&ptable.lock);
}

// Print the PIDs of zombies and their parents
void
dumpzombie(void) {
  struct proc *p;
  int ppid;

  acquire(&ptable.lock);
  p = ptable.pLists.zombie;
  cprintf("\nZombie List Processes:\n");
  if(!p) {
    cprintf("There are no processes in the list.\n");
    release(&ptable.lock);
    return;
  }
  while(p) {
    if(p->parent) {
      ppid = p->parent->pid;
    }
    else {
      ppid = initproc->pid;
    }

    cprintf("(%d,%d)", p->pid, ppid);
    if(p->next) {
      cprintf(" -> ");
    }
    p = p->next;
  }
  release(&ptable.lock);
}

// Print the count of unused processes
void dumpfree(void) {
  struct proc *p;
  int free = 0;

  acquire(&ptable.lock);
  p = ptable.pLists.free;
  while(p) {
    free++;
    p = p->next;
  }
  cprintf("\nFree List Size: %d Processes\n", free);
  release(&ptable.lock);
}

// Pop a process from the front of a given state list
static struct proc*
popStateList(struct proc** list) {
  // ptable lock must be aquired before calling this funciton
  struct proc *p;

  if(*list == 0)
    return 0;

  p = *list;
  *list = (*list)->next;
  p->next = 0;  // Set p->next to NULL before returning so it doesn't point anywhere
  return p;
}

// Wrapper for popStateList. Checks the status of the removed proc
static struct proc*
popStateList2(struct proc** list, enum procstate state) {
  struct proc *p;

  if((p = popStateList(list)))
    if(!stateEqual(p, state))
      panic("popStateList2: The state of the removed proc is different from the expected");

  return p;
}


// Used for adding an element to the end of a state list
static int
addToStateListEnd(struct proc** list, struct proc* proc) {
  // ptable lock must be aquired before calling this funciton
  struct proc* curr = *list;
  if(*list == 0) {
    *list = proc;   // Empty list
  }
  else {
    while(curr->next)
      curr = curr->next;
    curr->next = proc;
  }
  return 1;
}

// Wrapper for addToStateListEnd. Checks the state of a proc and success/failure of adding
static void
addToStateListEnd2(struct proc** list, struct proc* proc, enum procstate state) {
  if(!stateEqual(proc, state))
    panic("addToStateListEnd2: Attemped to add a proc with a state different from the expected");
  if(!addToStateListEnd(list, proc))
    panic("addToStateListHead2: Failed to add proc to the state list");
}


// Used to add to the head of a state list
static int
addToStateListHead(struct proc** list, struct proc* proc) {
  proc->next = *list;
  *list = proc;
  return 1;
}

// Wrapper for addToStateListHead
static void
addToStateListHead2(struct proc** list, struct proc* proc, enum procstate state) {
  if(!stateEqual(proc, state))
    panic("addToStateListHead2: Attemped to add a proc with a state different from the expected");
  if(!addToStateListHead(list, proc))
    panic("addToStateListHead2: Failed to add proc to the state list");
}

// Used to remove an element from a state list.
static int
removeFromStateList(struct proc** list, struct proc* proc) {
  // ptable lock must be aquired before calling this funciton
  struct proc *prev, *curr;
  if(*list) {
    prev = *list;
    curr = *list;
    while(curr != proc && curr->next) {
      prev = curr;
      curr = curr->next;
    }
    if(curr == proc) {
      if(curr == *list) {
        *list = (*list)->next;  // Removing proc from the head
      }
      else {
        prev->next = curr->next; // Removing proc from elsewhere
      }
      curr->next = 0;   // Set next to NULL before returning so it doesn't point anywhere
      return 1;
    }
  }
  return 0;
}

// Wrapper for removeFromStateList. Checks the state of a proc and success/failure of removal
static void
removeFromStateList2(struct proc** list, struct proc* proc, enum procstate state) {
  if(!removeFromStateList(list, proc))
    panic("removeFromStateList2: Failed to remove proc from the state list");
  if(!stateEqual(proc, state))
    panic("removeFromStateList2: The state of the removed proc is different from the expected");
}

static void
removeFromReadyList(struct proc** list, struct proc* proc, int prio) {
  removeFromStateList2(list, proc, RUNNABLE);
  if(proc->prio != prio)
    panic("removeFromReadyList: The prio of the the removed proc is different from the expected");
}

// Check if the state of a proc is equal to the given state
static int
stateEqual(struct proc* proc, enum procstate state) {
  if(proc){
    if(proc->state == state)
      return 1;
  }
  return 0;
}

#endif
