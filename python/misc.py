
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
b'\x00\x01\x30\x20'.decode('utf_32_be')   # egyptian symbol U013020 '𓀠'


# encodings
b'\x02\xd8\x01\xdd'.decode('utf_16_le')   # phoenician letter Bet '𐤁'
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

'"{}": {}'.format(val, num, last_char_code)

# -- old
'%s %s' % ('one', 'two')
'%d %d' % (1, 2)
'%s %-10d %.4f %x' % ('abc', 5, 7.3, 21)

# -- new
'{} {}'.format('one', 'two')
'{} {}'.format(1, 2)

'{0} {1}'.format(21, 3)
'{a} {p}'.format(a=5, p=2)
'{0[a]} {0[p]}'.format({'a':3, 'p':5})
'{0:5d} {1:05.4f}'.format(15, 7.3)


# object methods
dir(view)


# one line loop
[x for x in range(0, 6)]
''.join([chr(x) for x in range (0x61, 0x7b)])

# find duplicated lines in text and number of duplicates
sorted(list(set( [x for x in lines if lines.count(x) > 2] )))

# sort by key
sorted([{'name':'f1','val':5}, {'name':'f2','val':8}], key=lambda x: x['val'], reverse=True)

# get string from separated string of hex codes ('61 62 63' => 'abc')
''.join([chr(int(x, 16)) for x in s.split(' ')])
bytearray([int(x, 16) for x in s.split()]).decode('utf-8')


# one line if
True if 5>0 else False


# print hex bytes
''.join([hex(x).replace('0x','') for x in 'RIFF'.encode()])
[hex(x) for x in 'т'.encode()]
[hex(x) for x in 'т'.encode('utf_16_be')]
['%02x'%x for x in 'á'.encode('utf_32_be')]


# negative signed numbers
'{:x}'.format(-199703103 & (2**32-1))
hex(-199703103 & (2**32-1)) # 32-bit
hex(-199703103 & (2**64-1)) # 64-bit

40000 - 2*2**15 # 16-bit (int) -> (short)


# Named tuples
from collections import namedtuple
Item = namedtuple('Item', 'x y z')
i=Item(x='123',y='234',z='345')
i.x


# Run program
import subprocess
subprocess.getoutput('date')
subprocess.call('date')


# Local server (localhost:8000)
python -m http.server
python -m http.server 5000 --bind 127.0.0.1


# Convert incorrect rendering for cyrillic characters
'àáâãä'.encode('cp1252').decode('cp1251')
'áíóúñ'.encode('cp850').decode('cp866')


# convert dict to correct json string
import json
json.dumps({'a': 4}, indent=2)


# get import search path
import sys
print(sys.path)


# Zip a folder
def zip_folder_1(f):
    import os, shutil
    out_name = os.path.basename(f)
    os.chdir(os.path.dirname(f))
    shutil.make_archive(out_name, "zip", '.', out_name)  # use the compressed folder as the archive root
    shutil.make_archive(out_name, "zip", out_name)       # put the files without the root folder

def zip_folder_2(f):
    import os, zipfile
    out_name = os.path.basename(f)
    os.chdir(os.path.dirname(f))
    zipf = zipfile.ZipFile(out_name+'.zip', 'w', zipfile.ZIP_DEFLATED)
    for root, dirs, files in os.walk(out_name):
      for file in files:
        fp = os.path.join(root, file)
        arc_path = fp
        # arc_path = fp[len(out_name)+1:] # uncomment to compress files without root
        print(arc_path)
        zipf.write(fp, arc_path)
    zipf.close()

def zip_folder_3(f):
    import os, zipfile
    os.chdir(f)
    zipf = zipfile.ZipFile(f+'.zip', 'w', zipfile.ZIP_DEFLATED)
    for root, dirs, files in os.walk('.'):
      for file in files:
        fp = os.path.join(root, file)
        arc_path = fp
        arc_path = os.path.normpath(os.path.basename(f) + '/' + fp) # comment to compress files without root
        print(arc_path)
        zipf.write(fp, arc_path)
    zipf.close()


# Convert RGB to HSL (CSS style)
def convert_rgb_to_hsl(rgb):
    """
    Example: [122, 78, 34] => hsl(30, 56.4%, 30.6%)
    Example: #aaa => hsl(0, 0.0%, 66.7%)
    Example: #7a78bd => hsl(242, 34.3%, 60.6%)
    """
    import colorsys
    if type(rgb) == str and rgb[0] == '#':
        if len(rgb) == 4:
            rgb = [int(rgb[1]*2, 16), int(rgb[2]*2, 16), int(rgb[3]*2, 16)]
        elif len(rgb) == 7:
            rgb = [int(rgb[1:3], 16), int(rgb[3:5], 16), int(rgb[5:7], 16)]
    rgb = [x/255 for x in rgb]
    
    hsl = colorsys.rgb_to_hls(rgb[0], rgb[1], rgb[2])
    hsl = [round(hsl[0]*360), hsl[2]*100, hsl[1]*100]
    hsl = f'hsl({hsl[0]}, {hsl[1]:.1f}%, {hsl[2]:.1f}%)'
