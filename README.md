# Assembly_x86-SLAE
Collection of my NASM x86 SLAE course &amp; exam code

You must have NASM installed for the code to compile.

How to compile on linux x86/x86_64:
1. chmod +x compile.sh
2. ./compile.sh [file] (without .nasm extension)

How to get shellcode from binary file:
1. objdump -d ./PROGRAM|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'