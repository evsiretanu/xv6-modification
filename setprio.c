#include "RMME.h"
#define CS333_P3P4 1
#ifdef CS333_P3P4
#include "types.h"
#include "user.h"
#include "uproc.h"

int main(int argc, char** argv) {
  int pid, prio;

  if(argc < 3) {
    printf(2, "ERROR: This command takes exactly 2 arguments.\n");
    exit();
  }

  pid = atoi(argv[1]);
  prio = atoi(argv[2]);

  if(setpriority(pid, prio) < 0) {
    printf(2, "Failed to set priority %d for pid %d\n", prio, pid);
  }

  exit();

}


#endif