# standard variables, made explicit
CC = gcc
CFLAGS = -g -O2
CPPFLAGS =
LDFLAGS =
LDLIBS =


PROGRAMS = main

all: ${PROGRAMS}
main: main.c.o sub/libfoo.so

sub/%: sub.phony
	@# pattern rules need a body
# can't use .PHONY because it doesn't take a pattern
%.phony: FORCE
	${MAKE} -C $*
FORCE:

%: %.c.o
	${CC} ${LDFLAGS} $^ ${LDLIBS} -o $@

%.c.o: %.c
	${CC} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<

.SECONDARY:
