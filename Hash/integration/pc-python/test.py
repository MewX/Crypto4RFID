from ctypes import *
import platform
import sys

# the following codes show how to convert tuple into string in python
test_input = [
0x81,0x00,0x00,0x24,0xb0,0x13,0xf0,0x44,0x0c,0x43,0xb0,0x13,0x34,0x44,0xb0,0x13,
0xea,0x44,0x4f,0x14,0xc2,0x43,0x1c,0x02,0xb0,0x13,0xd2,0x44,0x4b,0x16,0x00,0x13,
0xf2,0xe0,0x40,0x00,0x23,0x02,0x92,0xc3,0x42,0x03,0x00,0x13,0xff,0x3f,0x03,0x43,
0xb2,0x40,0x80,0x5a,0x5c,0x01,0xf2,0xd0,0x40,0x00,0x25,0x02,0xf2,0xd0,0x40,0x00,
0x23,0x02,0x92,0xc3,0x30,0x01,0x1e,0x14,0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,
0x0e,0x73,0xfd,0x23,0x0d,0x93,0xfb,0x23,0x1d,0x16,0x03,0x43,0xf2,0xf0,0xbf,0x00,
0x23,0x02,0x1e,0x14,0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,0x0e,0x73,0xfd,0x23,
0x0d,0x93,0xfb,0x23,0x1d,0x16,0x03,0x43,0xf2,0xd0,0x40,0x00,0x23,0x02,0x1e,0x14,
0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,0x0e,0x73,0xfd,0x23,0x0d,0x93,0xfb,0x23,
0x1d,0x16,0x03,0x43,0xf2,0xf0,0xbf,0x00,0x23,0x02,0xe2,0xd3,0x02,0x02,0xe2,0xd3,
0x06,0x02,0xe2,0xd3,0x18,0x02,0xe2,0xd3,0x1a,0x02,0xe2,0xc3,0x1c,0x02,0xb2,0x40,
0x10,0x00,0x42,0x03,0xb2,0x40,0xe7,0x03,0x52,0x03,0xb2,0x40,0x10,0x01,0x40,0x03,
0x03,0x43,0x32,0xd0,0xd8,0x00,0x03,0x43,0x03,0x43,0x0c,0x43,0x10,0x01,0xb2,0x40,
0xde,0xc0,0x00,0x1c,0xd2,0xd3,0x02,0x1c,0x32,0xc2,0x03,0x43,0xb2,0x40,0x04,0xa5,
0x20,0x01,0xff,0x3f,0x03,0x43,0x03,0x43,0xff,0x3f,0x03,0x43,0x1c,0x43,0x10,0x01,
]
test_str = ''
for i in range(len(test_input)):
    test_str += chr(test_input[i])
print repr(test_str)
print "len:", len(test_input)

# here's the main hash function, be sure that you've compiled the library first
system_name = platform.system().lower()
print "platform name:", system_name
if 'window' in system_name:
    # load dll on windows
    print 'windows detected'
    xtea_dll = windll.xtea
    xtea_hash = xtea_dll.HASH_XTEA_PFMD
elif 'linux' in system_name:
    print 'linux detected'
    xtea_dll = cdll.LoadLibrary("./xtea.so")
    print repr(xtea_dll)
    xtea_hash = xtea_dll.HASH_XTEA_PFMD
    print repr(xtea_hash)
else:
    print 'unknown system'
    sys.exit()

# prepare for the parameters
nonce = c_uint64(0x1234567887654321) # 64-bit initial value
plain_text = create_string_buffer(test_str, len(test_str)) # string to byte array
text_size = c_uint16(len(test_str));
final_hash = c_uint64(0) # 64-bit

# call the hash function and get final results
xtea_hash(nonce, c_void_p(addressof(plain_text)), text_size, c_void_p(addressof(final_hash)))
print repr(hex(final_hash.value))
