#include <stdlib.h>

typedef struct {
    void (*f_iter)(int *xx, size_t xx_len, void (*f)(void *, int), void *d);
    void (*f_accum)(void *void_out, int in);
} funs_t;

static inline int abstract_iter_accum(const funs_t *funs, int *xx, size_t xx_len)
{
    int x = 0;
    funs->f_iter(xx, xx_len, funs->f_accum, &x);
    return x;
}