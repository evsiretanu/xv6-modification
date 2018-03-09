#ifdef CS333_P5
#include "types.h"
#include "user.h"

void
print_usage() {
  printf(2, "Usage: chown [owner id] [file name]\n");
}

int
main(int argc, char** argv)
{
  char* filename;
  int uid;

  if(argc != 3) {
    printf(2, "chown: missing operand.\n");
    print_usage();
    exit();
  }

  filename = argv[2];
  uid = atoi(argv[1]);
  if(uid < 0 || uid > 32767) {
    printf(2, "chown: invalid owner id.\n");
    print_usage();
    exit();
  }

  if((chown(filename, uid)) < 0) {
    printf(2, "chown: operation failed.\n");
  }

  exit();
}

#endif
