#include <stdlib.h>

#include "a.c"
#include "b.c"

int iter_accum(int *xx, size_t xx_len)
{
    funs_t funs = {
        .f_iter = &iter,
        .f_accum = &accum,
    };
    return abstract_iter_accum(&funs, xx, xx_len);
}
