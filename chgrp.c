#ifdef CS333_P5
#include "types.h"
#include "user.h"

void
print_usage() {
  printf(2, "Usage: chgrp [group id] [file name]\n");
}

int
main(int argc, char** argv)
{
  char* filename;
  int gid;

  if(argc != 3) {
    printf(2, "chgrp: missing operand.\n");
    print_usage();
    exit();
  }

  filename = argv[2];
  gid = atoi(argv[1]);
  if(gid < 0 || gid > 32767) {
    printf(2, "chgrp: invalid group id.\n");
    print_usage();
    exit();
  }

  if((chgrp(filename, gid)) < 0) {
    printf(2, "chgrp: operation failed.\n");
  }

  exit();
}

#endif
