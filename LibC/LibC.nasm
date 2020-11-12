; LibC.nasm
; Author: Ravehorn

extern printf
extern exit

global main

section .text
main:

    ; prints Hello, world! on the screen

    push message
    call printf
    add esp, 0x4 ; adjust the stack

    mov eax, 0xa
    call exit

section .data

    message: db "Hello, world!", 0xA, 0x00
    mlen equ $-message