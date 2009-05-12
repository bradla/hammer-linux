obj-$(CONFIG_HAMMER_FS) += hammer.o

hammer-objs := file.o super.o dfly_wrap.o hammer_ondisk.o hammer_undo.o
hammer-objs += crc32.o hammer_object.o hammer_btree.o hammer_transaction.o
hammer-objs += hammer_signal.o hammer_blockmap.o hammer_cursor.o
hammer-objs += hammer_flusher.o

ifndef EXTRA_CFLAGS
	export EXTRA_CFLAGS = -I$(shell pwd)/fs/hammerfs/dfly
endif

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	rm -f .*.cmd *.o .*.o.d modules.order
#	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
