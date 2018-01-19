#include "types.h"
#include "user.h"

int main(int arg, char *argv[]) {
  setuid(1);
  printf(1, "%d\n", getuid());
  setuid(2);
  printf(1, "%d\n", getuid());
  setuid(3);
  printf(1, "%d\n", getuid() );
  setuid(0);
  printf(1, "%d\n", getuid());
  setuid(-1);
  printf(1, "%d\n", getuid());
  setuid(33000);
  printf(1, "%d\n\n", getuid());

  printf(1, "%s", "\nGID\n");
  setgid(1);
  printf(1, "%d\n", getgid());
  setgid(2);
  printf(1, "%d\n", getgid());
  setgid(3);
  printf(1, "%d\n", getgid() );
  setgid(0);
  printf(1, "%d\n", getgid());
  setgid(-1);
  printf(1, "%d\n", getgid());
  setgid(33000);
  printf(1, "%d\n\n", getgid());

  exit();

}
