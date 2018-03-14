
# Print all charsets
from encodings.aliases import aliases
encs = list(aliases.keys())


# from bin/hex to dec
int('11111111', 2)
int('aa', 16)

# to hex
hex(123)


# string to hex bytes
import codecs
codecs.encode(b'a', 'hex_codec')  # 61 (0x61 = 97)


# from bytes to string
b'\x00\x61'.decode('utf_16_be')   # a
b'\x61\x00'.decode('utf_16_le')   # a
b'\x00\x01\x30\x20'.decode('utf_32_be')   # egyptian symbol U013020


# encodings
b'\x02\xd8\x01\xdd'.decode('utf_16_le')   # phoenician letter Bet
b'\xd8\x02\xdd\x01'.decode('utf_16_be')
chr(0x10901)                              # unicode codepoint
b'\x00\x01\x09\x01'.decode('utf_32_be')
b'\x01\x09\x01\x00'.decode('utf_32_le')
b'\xf0\x90\xa4\x81'.decode('utf_8')


# from bytes to int
int.from_bytes(b'\x02\x09', 'big')  # 521

import struct
struct.unpack('>H', b'\x00\x0a')[0] # 10


# to bytes
import struct
struct.pack('>H', 10)


# formatted print
num = 6
str = 'val'
last_char_code = ord(len(str)-1)

print( '"{}": {}'.format(val, num, last_char_code) )


# object methods
dir(view)


# one line loop
[x for x in range(0, 6)]
''.join([chr(x) for x in range (0x61, 0x7b)])

# one line if
True if 5>0 else False
