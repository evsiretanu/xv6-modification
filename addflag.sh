#/bin/sh
ls *.c | xargs -I {} sed -i '1s/^/\#include \"RMME.h\"\n/' {}
