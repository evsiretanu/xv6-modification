#include "types.h"
#include "user.h"

int main(int argc, char** argv) {
  int pc = 0;
  int rc;
  int MAXPROCS = 64;
  int child[64];

  for(int i = 0; i < MAXPROCS; i++) {
    rc = fork();
    if (rc < 0) {
      printf(2, "Fork failed!\n");
      break;

    } else if (rc == 0) {
      printf(1, "Proc created. PID: %d\n", getpid());
        // Sleep for a long time
        //sleep(1000 * 1000);
      for(;;);

    }
    else {
      child[pc] = rc;
      pc++;
    }
  }

  printf(1, "Parent pid: %d\n", getpid());
  printf(1, "Total processes created: %d\n", pc);
  printf(1, "Parent sleeping for 10 sec...\n");
  sleep(10 * 1000);

  // Killing Children
  for(int i = 0; i < pc; i++) {
    printf(1, "\nKilling child pid: %d\n", child[i]);
    kill(child[i]);
    printf(1, "Parent sleeping for 3 sec..\n");
    sleep(3 * 1000);
    if(wait() < 0)
      break;
  }

  exit();
}