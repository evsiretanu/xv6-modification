#include "RMME.h"
#include "types.h"
#include "user.h"
int main(int argc, char** argv) {
  int k = setpriority(1, 1);
  printf(1, "P: %d\n", k);
  
  k = setpriority(1, 7);
  printf(1, "P: %d\n", k);
  
  k = setpriority(90, 1);
  printf(1, "N: %d\n", k);
  
  k = setpriority(1, -1);
  printf(1, "N: %d\n", k);

  k = setpriority(1, 9);
  printf(1, "N: %d\n", k);
  
  exit();
}
