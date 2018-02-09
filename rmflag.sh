#/bin/sh
ls *.c | xargs -I {} sed -zi '1s/^\#include \"RMME.h\"\n//' {}
