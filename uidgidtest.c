#include "types.h"
#include "user.h"

void check_setuid(int uid) {
  int ret;
  int minbound = 0;
  int maxbound = 32767;

  //Check if set_uid returns a success code
  printf(1, "set uid to %d... ", uid);
  ret = setuid(uid);

  // Check if the given uid should be set
  if (uid >= minbound && uid <= maxbound) {
    if (ret < 0)
      printf(1, "fail\n");
    else
      printf(1, "ok\n");
  } else {
    // Check if the given uid should not be set
    if(ret == 0)
      printf(1, "fail\n");
    else if (ret < 0)
      printf(1, "ok\n");
  }
}

void check_getuid(int lastuid) {
  int ret;

  // Check if getuid() returns the uid that was set
  printf(1, "get uid (should be %d)... ", lastuid);
  ret = getuid();
  if(ret != lastuid)
    printf(1, "fail. returned: %d\n", ret);
  else
    printf(1, "ok\n");
}

int main(int arg, char *argv[]) {

  printf(1, "current uid: %d\n", getuid());
  check_setuid(32767);
  check_getuid(32767);
  check_setuid(0);
  check_getuid(0);
  check_setuid(100);
  check_getuid(100);
  check_setuid(-1);
  check_getuid(100);
  check_setuid(33000);
  check_getuid(100);
  exit();

}
