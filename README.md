# Minix 3 - Kernel System Call Example

This repository contains example code for creating **new system calls** at the kernel level in **Minix 3**.  
It was developed as a sample project for the **Operating Systems II** course in the **Computer Engineering program** at **Universidad Nacional Arturo Jauretche (UNAJ)**.

# Minix 3 - Custom System Call Example

This project demonstrates how to **create and test a new system call in Minix 3**, based on the material taught in the *Operating Systems II* course at **UNAJ**.

---

## Steps Overview

### 1. Create the syscall in the kernel
Follow the official Minix tutorial:  
[Minix Developer Guide – New Kernel Call](https://wiki.minix3.org/doku.php?id=developersguide:newkernelcall)

Note: The tutorial refers to paths like `/usr/src/minix`, but in our version the sources are directly under `/usr/src`.

The key file where the user-space wrapper must be implemented is:

/usr/src/lib/libsys/sys_sample.c


# Example implementation:

```c
#include "syslib.h"

int sys_sample(unsigned flags, endpoint_t proc_ep)
{
    message m;
    printf("HOLA MUNDO!!!\n");
    printf("El contador de mensajes es...");
    return (_kernel_call(SYS_SAMPLE, &m));
}
```
# Execute the syscall from user space

Since we are working at the kernel level, we load it as a service (driver).
For reference, check the first example from:
Minix Developer Guide – Driver Programming

```c
#include <stdio.h>
#include <stdlib.h>
#include <minix/syslib.h> // For sys_sample

int main(void) {
    unsigned flags = 0;
    endpoint_t proc_ep = SELF;

    printf("Calling sys_sample...\n");
    int result = sys_sample(flags, proc_ep);

    if (result == 0) {
        printf("sys_sample returned OK. Success!\n");
    } else {
        printf("sys_sample failed with error code: %d\n", result);
    }

    return 0;
}
```
# Create the service configuration file

Example configuration (/etc/system.conf.d/sample_test.conf):

service sample_test
{
    system
        UMAP        # 14
        IRQCTL      # 19
        DEVIO       # 21
        SAMPLE      # 59
    ;
    ipc
        SYSTEM PM RS LOG TTY DS VM VFS
        pci inet amddev
    ;
    uid 0;
};

Important: The number 59 for SAMPLE corresponds to the definition of SYS_SAMPLE in com.h.
Use the number that matches your own syscall definition.

# Makefile for the service

Example Makefile:

PROG=   sample_test
SRCS=   sample_test.c

FILES=${PROG}.conf
FILESNAME=${PROG}
FILESDIR= /etc/system.conf.d

DPADD+= ${LIBCHARDRIVER} ${LIBSYS}
LDADD+= -lchardriver -lsys

MAN=

.include <minix.service.mk>

Compile and install with:

make
make install

# Permissions issue (if any)
If you face permission errors, edit /etc/system.conf and append:

service sample_test
{
    system
        SAMPLE    #59
    ;
    ipc
        SYSTEM PM RS LOG TTY DS VM VFS
        ;
    uid 0;
};

# Academic Context
This example was designed for the Operating Systems II course at UNAJ, to show how user programs can interact with new kernel-level functionality via custom system calls.

# License
Educational use only.
Feel free to adapt this material for learning and teaching.

