; Loops.nasm
; Author: Ravehorn

global _start

section .text

_start:

    ; main func and ECX counter to 10000
    mov eax, 0x0
    mov ecx, 0x10000
    jmp PrintFunc


PrintFunc:

    ; prints Hello, world! on the screen (uses ECX as a counter)
    push ecx

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [message]
    lea edx, [mlen]
    int 0x80

    pop ecx
    loop PrintFunc

    jmp ExitFunc

ExitFunc:

    ; exits the program

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

section .data

    message: db "01"
    mlen: equ $-message