#!/bin/bash

echo '[+] Assembling with NASM...'
nasm -f elf32 -o $1.o $1.nasm

echo '[+] Linking...'
ld -m elf_i386 -o $1 $1.o

echo '[+] Done!'
