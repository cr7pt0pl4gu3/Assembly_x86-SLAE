#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x31\xc0\xb0\x01\x31\xdb\xb3\x10\xcd\x80";

int main(void) {
    printf("Shellcode Length: %d\n", strlen(code));
    ((void(*)(void))code)();
}