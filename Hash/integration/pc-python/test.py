from ctypes import *

# Use cdll for functions compiled with __cdecl
#
libc = cdll.msvcrt
print "The time() is: " + str(libc.time())

xtea_dll = windll.xtea
xtea_hash = xtea_dll.HASH_XTEA_PFMD

print repr(xtea_hash)

