; HelloWorld.asm
; Author: Ravehorn

global _start

section .text

_start:

    ; prints Hello, world! on the screen

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [message]
    lea edx, [mlen]
    int 0x80

    ; exits the program

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

section .data

    message: db "Hello, world!"
    mlen equ $-message
