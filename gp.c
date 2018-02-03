#include "RMME.h"
#ifdef CS333_P2
#include "types.h"
#include "user.h"
#include "uproc.h"

int
main (int argc, char **argv) {
  int nprocs = 0;
  int size = 0;
  int MAXPROCS = 60;   // Procs to create
  struct uproc *procs;
  struct uproc *cp;

  if (argc != 2) {
    printf(2, "ERROR: This command takes exactly 1 argument.\n");
    exit();
  }

  nprocs = atoi(argv[1]);
  if (nprocs < 1 || nprocs > 72) {
    printf(2, "ERROR: Value must be 1 < value <= 72\n");
    exit();
  }

  procs = malloc(nprocs * sizeof(struct uproc));
  printf(1, "Creating new procs...\n");

  for (int i = 0; i < MAXPROCS; i++) {
    int rc = fork();
    if(rc < 0) {
      // failed
      printf(1, "fork failed!\n");
      exit();
    } else if (rc == 0) {
      // child
      exit();
    }
  }

  // Check if getprocs returned a desired number of procs
  if((size = getprocs(nprocs, procs)) != nprocs) {
    printf(2, "Error: gp call failed. %s at line %d\n",
           __FILE__, __LINE__);
  } else {
    cp = procs;
    printf(1, "\nPID\tName\tUID\tGID\tPPID\tElapsed\tCPU\tState\tSize\n");
    for (int i = 0; i < size; i++) {
      printf(1, "%d\t%s\t%d\t%d\t%d\t%d.%d%d%d\t%d.%d\t%s\t%d\n",
             cp->pid, cp->name, cp->uid, cp->gid, cp->ppid,
             cp->elapsed_ticks / 1000, (cp->elapsed_ticks / 100) % 10, (cp->elapsed_ticks / 10) % 10,
             (cp->elapsed_ticks) % 10,
             cp->CPU_total_ticks / 1000, (cp->CPU_total_ticks / 100) % 10, cp->state, cp->size);
      cp++;
    }

    sleep(30 * 1000);   // Allow the user to compare the results with ps
  }

  while(wait() > 0);
  free(procs);
  
  exit();
}

#endif
