#include "syslib.h"

int sys_sample(unsigned flags, endpoint_t proc_ep)
{
        message m;
        printf("HOLA MUNDO!!!\n");
        return(_kernel_call(SYS_SAMPLE, &m));
}
