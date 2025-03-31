# --------------------------------------------------------------------
AS      ?= as
CC      ?= clang
CFLAGS  ?= -O3 -Wall -Wextra -Wpedantic -Wvla -Werror -std=c99 \
	         -Wundef -Wshadow -Wcast-align -Wpointer-arith -Wmissing-prototypes \
	         -fstrict-aliasing -fno-common -pipe

# --------------------------------------------------------------------

default: example

example: example.c poly1305_ref.s ../../../ext/randombytes/randombytes.o
	$(CC) $(CFLAGS) -I../../../ext/randombytes/ -o $@ $^

../../../ext/randombytes/randombytes.o: ../../../ext/randombytes/randombytes.c
	make -C ../../../ext/randombytes/

clean:
	rm -f example

# --------------------------------------------------------------------

__poly1305_ref.s:
	jasminc -noinsertarraycopy -nowarning poly1305_ref.jazz -o poly1305_ref.s

