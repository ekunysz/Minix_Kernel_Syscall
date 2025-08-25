#include <stdio.h>
#include <stdlib.h>
#include <minix/syslib.h> // For sys_sample

int main(void) {
    unsigned flags = 0; // You can define specific flags for your kernel call if needed
    endpoint_t proc_ep = SELF; // Or the endpoint of another process you want to affect

    printf("Calling sys_sample...\n");

    // Call your new kernel function
    int result = sys_sample(flags, proc_ep);

    if (result == 0) {
        printf("sys_sample returned OK. Success!\n");
    } else {
        printf("sys_sample failed with error code: %d\n", result);
    }

    return 0;
}
