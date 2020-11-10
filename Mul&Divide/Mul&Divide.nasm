; Mul&Divide.nasm
; Author: Ravehorn

global _start

section .text

_start:
    
    ; register based multiplication

    mov eax, 0x0
    mov ax, 0x2
    mov bx, 0x3
    mul bx
    mov [var1], ax
    add byte [var1], '0'

    ; print actual result

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [var1]
    lea edx, [var1len]
    int 0x80

    ; print space and comma

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [space_comma]
    lea edx, [space_commalen]
    int 0x80

    ; register based division

    mov dx, 0x0
    mov ax, 0x6
    mov cx, 0x2
    div cx
    mov [var2], ax
    add byte [var2], '0'

    ; print actual result

    mov eax, 0x4
    mov ebx, 0x1
    lea ecx, [var2]
    lea edx, [var2len]
    int 0x80

    ; exits the program

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

section .data

    var1: db 0x0000
    var1len: equ $-var1
    var2: db 0x0000
    var2len: equ $-var1
    space_comma: db ", "
    space_commalen: equ $-space_comma