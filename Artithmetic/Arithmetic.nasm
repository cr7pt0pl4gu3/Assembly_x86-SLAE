; Arithmetic.nasm
; Author: Ravehorn

global _start

section .text

_start:

    ; register based addition

    mov eax, 0x0
    add byte [var1], 0x4
    add byte [var1], 0x4
    add byte [var1], '0'

    ; print actual result

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [var1]
    lea edx, [var1len]
    int 0x80

    ; exits the program

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80


section .data

    var1: db 0x00
    var1len: equ $-var1
