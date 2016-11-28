LIBTP = libthreadpool.so
OBJS = thpool.o

all: $(LIBTP)

override CFLAGS += -MMD -Wall -Werror -fPIC

$(LIBTP): $(OBJS)
	 $(CC) $(LDFLAGS) $(CFLAGS) -shared -o $@ -Wl,-soname,$@ $^

clean:
	-rm -f $(LIBTP) *.elf *.gdb *.o *.d

install: $(LIBTP)
	install -d $(DESTDIR)/$(INCLUDEDIR)
	install thpool.h $(DESTDIR)/$(INCLUDEDIR)/thpool.h
	install -d $(DESTDIR)/$(LIBDIR)
	install libthreadpool.so $(DESTDIR)/$(LIBDIR)/libthreadpool.so
