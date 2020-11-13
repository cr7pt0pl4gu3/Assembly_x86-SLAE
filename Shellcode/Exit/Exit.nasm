; Exit.nasm
; Author: Ravehorn

global _start

section .text

_start:

    ; exits the program

    xor eax, eax
    mov al, 0x1
    xor ebx, ebx
    mov bl, 0x10
    int 0x80