
bytearray([0xc2,0xb5]).decode()

# Print hex codes for a string
s = '123'
' '.join('{:02x}'.format(ord(c)) for c in s)

'lÃ¡grimas'.encode('latin1').decode('utf8')


# Check conversion pairs for encodings on an unknown text
def check_all_encodings(text, encodings=None, print_errors=False):
  import codecs
  from encodings.aliases import aliases
  
  if not encodings:
    encodings = list(aliases.keys())
  
  total = ''
  f = codecs.open('encodings_output.txt', 'w', 'utf8')
  
  for enc_enc in encodings:
    for enc_dec in encodings:
      
      try:
        res = text.encode(enc_enc).decode(enc_dec)
      except:
        if not print_errors:
          continue
        res = '##ERROR##'
        
      log = '[' + enc_enc + ' - ' + enc_dec + ']: ' + res
      f.write(log + '\n')
  
  f.close()


encs = [
  'ascii', 'big5', 'big5hkscs', 'cp037', 'cp424', 'cp437', 'cp500', 'cp720', 'cp737', 'cp775', 'cp850', 'cp852', 'cp855', 'cp856', 'cp857', 'cp858', 'cp860', 'cp861', 'cp862', 'cp863', 'cp864', 'cp865', 'cp866', 'cp869', 'cp874', 'cp875', 'cp932', 'cp949', 'cp950', 'cp1006', 'cp1026', 'cp1140', 'cp1250', 'cp1251', 'cp1252', 'cp1253', 'cp1254', 'cp1255', 'cp1256', 'cp1257', 'cp1258', 'euc_jp', 'euc_jis_2004', 'euc_jisx0213', 'euc_kr', 'gb2312', 'gbk', 'gb18030', 'hz', 'iso2022_jp', 'iso2022_jp_1', 'iso2022_jp_2', 'iso2022_jp_2004', 'iso2022_jp_3', 'iso2022_jp_ext', 'iso2022_kr', 'latin_1', 'iso8859_2', 'iso8859_3', 'iso8859_4', 'iso8859_5', 'iso8859_6', 'iso8859_7', 'iso8859_8', 'iso8859_9', 'iso8859_10', 'iso8859_11', 'iso8859_13', 'iso8859_14', 'iso8859_15', 'iso8859_16', 'johab', 'koi8_r', 'koi8_u', 'mac_cyrillic', 'mac_greek', 'mac_iceland', 'mac_latin2', 'mac_roman', 'mac_turkish', 'ptcp154', 'shift_jis', 'shift_jis_2004', 'shift_jisx0213', 'utf_32', 'utf_32_be', 'utf_32_le', 'utf_16', 'utf_16_be', 'utf_16_le', 'utf_7', 'utf_8', 'utf_8_sig'
]

text = 'Ã¡bcÃ³'
check_all_encodings(text, encs)
