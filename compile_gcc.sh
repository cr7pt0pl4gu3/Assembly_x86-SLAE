#!/bin/bash

echo '[+] Assembling with NASM...'
nasm -f elf32 -o $1.o $1.nasm

echo '[+] Linking...'
gcc -m32 -o $1 $1.o

echo '[+] Done!'
