; DeleteDisk.nasm
; Author: Ravehorn

global _start

section .text

_start:

    xor eax, eax            ;create null eax register
    push eax                ;push null eax register to the stack

    push 0x736c2f2f         ;push command to the stack
    push 0x6e69622f         ;"/bin//ls"
    mov ebx, esp            ;move pointer to command into ebx

    push eax                ;push null eax register to the stack
    push 0x61616c2d         ;push argument to the stack "-laa"
    mov esi, esp            ;move stack pointer to esi

    push eax                ;push null eax register to the stack
    push esi                ;push address of the argument to the stack
    push ebx                ;push address of the command to the stack
    mov ecx, esp            ;move pointer to start of the command to ecx


    mov al, 11              ;define execve
    int 0x80                ;execute command