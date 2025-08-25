#Sample_test 
cp /usr/src/include/minix/com.h mnt/kernel
cp /usr/src/include/minix/syslib.h mnt/kernel
cp /usr/src/kernel/system.c mnt/kernel
cp /usr/src/kernel/system.h mnt/kernel

cp /usr/src/kernel/system/Makefile.inc mnt/kernel

cp /usr/src/commands/service/parse.c mnt/kernel

cp /usr/src/lib/libsys/Makefile mnt/kernel

cp /usr/src/drivers/sample_test/sample_test.c mnt/kernel/test
cp /usr/src/drivers/sample_test/sample_test.conf mnt/kernel/test
cp /usr/src/drivers/sample_test/Makefile mnt/kernel/test
