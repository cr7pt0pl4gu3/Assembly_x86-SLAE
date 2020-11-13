#!/bin/bash

echo '[+] Compiling...'
gcc -m32 -fno-stack-protector -z execstack -o $1 $1.c

echo '[+] Done!'
