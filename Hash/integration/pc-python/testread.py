#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ctypes import *
import platform
import sys
import re

f               = open("./hashTest2.hex", "rb")
wispDataLine    = f.readlines()
data            = ''

for i in range(0,len(wispDataLine)):
    data += wispDataLine[i]

data = re.sub(r"\s", '', data).lower() # prevent line breaks, spaces, tabs
print(wispDataLine)
print(repr(data))

# convert 'ab' to '\xab'
print('len: ', len(data))
text = data.decode("hex")
print(repr(text))

# here's the main hash function, be sure that you've compiled the library first
system_name = platform.system().lower()
print("platform name:", system_name)
if 'window' in system_name:
    # load dll on windows
    print('windows detected')
    xtea_dll = windll.xtea
    xtea_hash = xtea_dll.HASH_XTEA_PFMD
elif 'linux' in system_name:
    print('linux detected')
    xtea_dll = cdll.LoadLibrary("./xtea.so")
    print(repr(xtea_dll))
    xtea_hash = xtea_dll.HASH_XTEA_PFMD
    print(repr(xtea_hash))
else:
    print('unknown system')
    sys.exit()

# prepare for the parameters
nonce = c_uint64(0x1234567887654321) # 64-bit initial value
plain_text = create_string_buffer(text, len(text)) # string to byte array
text_size = c_uint16(len(text));
final_hash = c_uint64(0) # 64-bit

# call the hash function and get final results
xtea_hash(nonce, c_void_p(addressof(plain_text)), text_size, c_void_p(addressof(final_hash)))
print(repr(hex(final_hash.value)))
