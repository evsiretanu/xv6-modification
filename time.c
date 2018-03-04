#include "RMME.h"
#ifdef CS333_P2
#include "types.h"
#include "user.h"

int
main(int argc, char* argv[])
{
  int rc;
  int time_start;
  int total_time = 0;
  char* args[argc];
  args[0] = "" ;      // Needed in order to not print command name if no args were given

  if(argc > 1) {
    for(int i = 0; i < argc-1; i++) {
      args[i] = argv[i+1];    // Skip argv[0]
    }
    args[argc] = "NULL";

    time_start = uptime();
    rc = fork();
    if(rc < 0) {
      // Fork failed
      printf(2, "Error: time call failed. %s at line %d\n",
             __FILE__, __LINE__);
      exit();
    } else if (rc == 0) {
      // Child process
      exec(args[0], args);
      printf(2, "Error: failed to execute %s\n", args[0]);  // Will happen only if exec fails
      exit();
    } else {
      // Parent process
      wait();
      total_time = uptime() - time_start;
    }
  }

  printf(1, "%s ran in %d.%d%d%d seconds\n", args[0], total_time/1000, (total_time/100)%10, (total_time/10)%10, (total_time%10));
  exit();
}

#endif
