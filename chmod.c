#include "RMME.h"
#ifdef CS333_P51
#include "types.h"
#include "user.h"


int
main(int argc, char** argv)
{
  //printf(1, "Not imlpemented yet.\n");
  int k = chmod(argv[2], atoo(argv[1]));
  printf(1, "%d\n", k);
  exit();
}

#endif
