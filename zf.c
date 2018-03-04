#include "RMME.h"
#include "types.h"
#include "user.h"

int main(int argc, char** argv) {
  int pc = 0;
  int rc;
  int MAXPROCS = 30;
  int child[64];
  int cmd;

  if (argc != 2) {
    printf(2, "ERROR: This command takes exactly 1 argument.\n");
    exit();
  }

  cmd = atoi(argv[1]);
  if(cmd == 0)
    MAXPROCS = 1;     // Create only 1 process

  if(cmd < 0 || cmd > 2){
    printf(2, "ERROR: The arguments can only be 0, 1 or 2.\n");
    exit();
  }

  for(int i = 0; i < MAXPROCS; i++) {
    rc = fork();
    if (rc < 0) {
      printf(2, "Fork failed!\n");
      break;

    } else if (rc == 0) {
      printf(1, "Proc created. PID: %d\n", getpid());
      switch(cmd){
        case 0:
          sleep(2);           // Sleep to allow parent to run
          exit();
        case 1:
          sleep(1000 * 1000); // Sleep for a long time
          break;
        case 2:
          for(;;);            // Loop forever
      }
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

  if(cmd == 0) {
    wait();
  }
  else {
    // Killing Children
    for(int i = 0; i < pc; i++) {
      printf(1, "\nKilling child pid: %d\n", child[i]);
      kill(child[i]);
      printf(1, "Parent sleeping for 3 sec..\n");
      sleep(3 * 1000);
      if(wait() < 0)
        break;
    }
  }

  exit();
}
