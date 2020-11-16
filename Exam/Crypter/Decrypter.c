#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <openssl/md5.h>

unsigned char brute_key() {
    srand(time(0));
    unsigned char key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26] + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26];
    return key;
}

void print_array(unsigned char *shellcode, long unsigned int arr_size) {
    for (int i = 0; i < arr_size; i++) {
        printf("%x", shellcode[i]);
    }
    printf("\n");
}

int main(void) {
    unsigned char shellcode[] = \
    "\xA7\x56\xC6\xFE\xF4\xF7\xE5\xFE\xFE\xF4\xFF\xF8\xB9\xFE\xB9\xB9\xB9\xB9\x1F\x75\xC6\x1F\x74\xC5\x1F\x77\x26\x9D\x5B\x16\x96";
    
    printf("Encrypted shellcode:");
    print_array(shellcode, sizeof(shellcode));
    
    printf("Bruting key:");
    unsigned char key = generate_key();
    printf("%x\n", key);

    printf("Encrypted shellcode:");
    encrypt(shellcode, sizeof(shellcode), &key);
    print_array(shellcode, sizeof(shellcode));

    return 0;
}