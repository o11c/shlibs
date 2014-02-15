# standard variables, made explicit
CC = gcc
CFLAGS = -g -O2
CPPFLAGS =
LDFLAGS =
LDLIBS =


PROGRAMS = main

# version for shared libraries
SO = 2
PICFLAGS = -fPIC
SOFLAGS = -shared -Wl,-soname,lib$*.so

all: ${PROGRAMS}
main: main.c.o libfoo.so
lib%.so: lib%.so.${SO}
	ln -sf $< $@
libfoo.so.${SO}: foo.pic.c.o

%: %.c.o
	${CC} ${LDFLAGS} $^ ${LDLIBS} -o $@
lib%.so.${SO}: %.pic.c.o
	${CC} ${LDFLAGS} ${SOFLAGS} $^ ${LDLIBS} -o $@

%.c.o: %.c
	${CC} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<
%.pic.c.o: %.c
	${CC} ${CFLAGS} ${PICFLAGS} ${CPPFLAGS} -c -o $@ $<
