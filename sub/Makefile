# standard variables, made explicit
CC = gcc
CFLAGS = -g -O2
CPPFLAGS =
LDFLAGS =
LDLIBS =


PROGRAMS = libfoo.so libbar.so

# version for shared libraries
SO_SHORT = 2
SO_LONG = 2.1.3
PICFLAGS = -fPIC
SOFLAGS = -shared -Wl,-soname,lib$*.so.${SO_SHORT}

all: ${PROGRAMS}
lib%.so: lib%.so.${SO_SHORT}
	ln -sf $< $@
lib%.so.${SO_SHORT}: lib%.so.${SO_LONG}
	ln -sf $< $@
libfoo.so.${SO_LONG}: foo.pic.c.o

lib%.so.${SO_LONG}: %.pic.c.o
	${CC} ${LDFLAGS} ${SOFLAGS} $^ ${LDLIBS} -o $@

%.pic.c.o: %.c
	${CC} ${CFLAGS} ${PICFLAGS} ${CPPFLAGS} -c -o $@ $<

.SECONDARY:
