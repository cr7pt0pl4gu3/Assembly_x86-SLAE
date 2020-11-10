; ControlFlow.nasm
; Author: Ravehorn

global _start

section .text

_start:

    ; compares two predefined variables

    mov eax, 0x0
    mov al, [var1]
    mov ah, [var2]
    cmp al, ah
    je TrueFunc
    jne FalseFunc


TrueFunc:

    ; prints success

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [success]
    lea edx, [successlen]
    int 0x80
    jmp ExitFunc

FalseFunc:

    ; prints failure

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [failure]
    lea edx, [failurelen]
    int 0x80
    jmp ExitFunc

ExitFunc:

    ; exits the program

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

section .data

    var1: db 0x8
    var1len: equ $-var1
    var2: db 0x8
    var2len: equ $-var2
    success: db "Success!"
    successlen: equ $-success
    failure: db "Failure!"
    failurelen: equ $-failure