#ifdef CS333_P5
#include "types.h"
#include "user.h"

void
print_usage() {
  printf(2, "Usage: chmod [mode(0000 - 1777)] [file name]\n");
}

int
main(int argc, char** argv)
{
  char* filename;
  int mode;

  if(argc != 3) {
    printf(2, "chmod: missing operand.\n");
    print_usage();
    exit();
  }

  filename = argv[2];
  mode = atoi(argv[1]);
  if(strlen(argv[1]) != 4 || mode < 0 || mode > 1777) {
    printf(2, "chmod: invalid mode.\n");
    print_usage();
    exit();
  }

  mode = atoo(argv[1]);
  if((chmod(filename, mode)) < 0) {
    printf(2, "chmod: operation failed.\n");
  }

  exit();
}

#endif
