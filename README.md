# Assembly_x86-SLAE
Collection of my NASM x86 SLAE course &amp; exam code

You must have NASM installed for the code to compile.

How to compile on linux x86/x86_64:
1. chmod +x compile.sh
2. ./compile.sh [file] (without .nasm extension)

How to get shellcode from binary file:
1. https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump

How to encode shellcode with msfvenom:
1. For C file:

echo -ne "YOUR_SHELLCODE" | sudo msfvenom -a x86 --format c --platform Linux -e x86/shikata_ga_nai -c 10

2. For executable:

echo -ne "YOUR_SHELLCODE" | sudo msfvenom -a x86 --format elf --platform Linux -e x86/shikata_ga_nai -c 10