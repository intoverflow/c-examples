#include <stdlib.h>

static inline void iter(int *xx, size_t xx_len, void (*f)(void *, int), void *d)
{
    for (size_t i = 0; i < xx_len; i++)
    {
        f(d, xx[i]);
    }
}

static inline void accum(void *void_out, int in)
{
    int *out = (int *)void_out;
    *out += in;
}
