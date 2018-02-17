#include "types.h"
#include "user.h"
int main(int argc, char** argv) {
  int k = setpriority(1, atoi(argv[1]));
  printf(1, "%d", k);
  exit();
}
