#ifdef CS333_P2
#include "types.h"
#include "user.h"
#include "uproc.h"
int
main(void)
{
  uint maxprocs = 32;
  struct uproc *procs = malloc(maxprocs * sizeof(struct uproc));
  struct uproc *cp; // Pointer to a current uproc
  int size = 0;

  size = getprocs(maxprocs, procs);
  if(size  < 1) {
    printf(2, "Error: ps call failed. %s at line %d\n",
           __FILE__, __LINE__);
    exit();
  }

  cp = procs;
  printf(1, "\nPID\tName\tUID\tGID\tPPID\tElapsed\tCPU\tState\tSize\n");
  for(int i = 0; i < size; i++) {
    printf(1, "%d\t%s\t%d\t%d\t%d\t%d.%d%d%d\t%d.%d\t%s\t%d\n",
           cp->pid, cp->name, cp->uid, cp->gid, cp->ppid,
           cp->elapsed_ticks/1000, (cp->elapsed_ticks/100)%10, (cp->elapsed_ticks/10)%10, (cp->elapsed_ticks)%10,
           cp->CPU_total_ticks/1000, (cp->CPU_total_ticks/100)%10, cp->state, cp->size);
    cp++;
  }

  free(procs);
  exit();
}
#endif
