#Sample Test
cp mnt/kernel/com.h /usr/src/include/minix
cp mnt/kernel/syslib.h /usr/src/include/minix
cp mnt/kernel/system.c /usr/src/kernel
cp mnt/kernel/system.h /usr/src/kernel
cp mnt/kernel/do_sample.c /usr/src/kernel/system
cp mnt/kernel/Makefile.inc /usr/src/kernel/system
cp mnt/kernel/parse.c /usr/src/commands/service
cp mnt/kernel/sys_sample.c  /usr/src/lib/libsys
cp mnt/kernel/Makefile /usr/src/lib/libsys

mkdir /usr/src/drivers/sample_test
cp mnt/kernel/test/sample_test.c /usr/src/drivers/sample_test
cp mnt/kernel/test/sample_test.conf /usr/src/drivers/sample_test
cp mnt/kernel/test/Makefile /usr/src/drivers/sample_test
