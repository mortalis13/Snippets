
filename = 'c:\\test'

# ----------- read unicode ----------

f = codecs.open(filename, encoding='utf-8')
lines=f.readlines()

for x in lines:
  print(x)
  
file.close()

  
# ----------- write unicode ----------

file = codecs.open(filename, encoding='utf-8', mode='w+')
str='test'
file.write(str)

file.close()
