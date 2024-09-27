special = [' ', '!', '#', '$', '%', '&', '\'', '(', ')', '+', ',', '-', '.', ';', '=', '@', '[', ']', '^', '_', '`', '{', '}', '~']

def compare(a: str, b: str) -> int:
  '''
  Compare numerically with special characters in front
  loop full strings until the end or different chars
  2 main branches: for normal characters (with priority for special chars) and for numeric sequence
  '''
  len_a = len(a)
  len_b = len(b)
  
  numcmp = False
  num_a = num_b =''
  
  ida = idb = 0
  a_end = b_end = False
  
  while True:
    if ida >= len_a:
      a_end = True
    else:
      ca = a[ida]
    
    if idb >= len_b:
      b_end = True
    else:
      cb = b[idb]
    
    ida += 1
    idb += 1
    
    if not numcmp:
      # both strings ended without breaks
      if a_end and b_end:
        return 0
      
      if ca in special and cb not in special: return -1
      if ca not in special and cb in special: return 1

      if ca.isdigit() and cb.isdigit() and ca != '0' and cb != '0':  # 01 is before 1
        numcmp = True
        ida = idb = idb - 1  # proc numbers in other branch
        continue

      if ca.isdigit() and not cb.isdigit(): return -1
      if not ca.isdigit() and cb.isdigit(): return 1
      
      if ca != cb: return ord(ca) - ord(cb)

    else:
      # both strings ended, 1 ended and other is on char (nothing to compare against), both are chars
      if (a_end and b_end
          or a_end and not cb.isdigit()
          or b_end and not ca.isdigit()
          or not ca.isdigit() and not cb.isdigit() and num_a != num_b
      ):
        return int(num_a) - int(num_b)
      
      if not ca.isdigit() and not cb.isdigit():
        numcmp = False
        ida = idb = idb - 1  # proc chars in other branch
        num_a = num_b = ''
        continue
        
      if not a_end and ca.isdigit(): num_a += ca
      if not b_end and cb.isdigit(): num_b += cb


def compare2(a: str, b: str) -> int:
  len_a = len(a)
  len_b = len(b)
  
  num_a = ''
  num_b = ''
  numcmp = False
  
  i = 0
  total = min(len_a, len_b)
  
  while i < total:
    ca = a[i]
    cb = b[i]
    i += 1

    if numcmp:
      if not ca.isdigit() and not cb.isdigit():
        if num_a != num_b: return int(num_a) - int(num_b)
        numcmp = False
        num_a = num_b = ''

        if ca != cb: return ord(ca) - ord(cb)
        
      if ca.isdigit(): num_a += ca
      if cb.isdigit(): num_b += cb

    else:
      if not ca.isdigit() and not cb.isdigit():
        if ca != cb: return ord(ca) - ord(cb)
        continue

      if ca.isdigit() and not cb.isdigit(): return -1
      if not ca.isdigit() and cb.isdigit(): return 1

      numcmp = True
      num_a = ca
      num_b = cb
  
  if numcmp:
    if len_a < len_b:
      while i < len_b and b[i].isdigit():
        num_b += b[i]
        i += 1
      
    if len_a > len_b:
      while i < len_a and a[i].isdigit():
        num_a += a[i]
        i += 1
    
    return int(num_a) - int(num_b)
  
  return len_a - len_b


kit = [
  ('abc', 'ert'),
  ('abc1', 'abc2'),
  ('_abc', 'abc'),
  ('-abc', 'abc'),
  ('01', '02'),
  ('9', '10'),
  ('9.x', '10.y'),
  ('0', 'abc'),
  ('abc9', 'abc10'),
  ('abc9', 'abc10www'),
  ('abc86', 'abc97'),
  ('abc09', 'abc10'),
  ('abc09', 'abc10poi'),
  ('abc99asdasd', 'abc889qweqwe'),
  ('abc11eee12', 'abc11eee43'),
  ('abc11a', 'abc11abc'),
  ('abc11a', 'abc11eq'),
  ('abc9ab', 'abc10b'),
  ('abc9ab', 'abc102345'),
  ('abc1b', 'abc9a'),
  ('abc1aa', 'abc9ab'),
  ('abc12a', 'abc12b'),
]

kit_eq = [
  ('43', '43'),
  ('wow', 'wow'),
  ('wow123', 'wow123'),
  ('123wow', '123wow'),
]


def test_compare():
  print('--test compare()--')
  _kit = []
  _kit.extend(kit)
  _kit.extend([
    ('09', '9'),
    ('abc09', 'abc9'),
    ('abc09a', 'abc9'),
    ('abc09af', 'abc9b'),
    ('abc09b', 'abc9a'),
    
    ('_abc', '01. abc'),
    ('-abc', '01. abc'),
    ('$abc', 'abc'),
    ('#abc', '123'),
    ('@abc', 'abcd'),
    ('!abc', 'abc45'),
  ])
  
  for s in _kit:
    print(s)
    assert compare(s[0], s[1]) < 0
    assert compare(s[1], s[0]) > 0
  
  print()
  for s in kit_eq:
    print(s)
    assert compare(s[0], s[1]) == 0
  print()

  
def test_compare2():
  print('--test compare2()--')
  for s in kit:
    print(s)
    print(s)
    assert compare2(s[0], s[1]) < 0
    assert compare2(s[1], s[0]) > 0
  
  print()
  for s in kit_eq:
    print(s)
    assert compare2(s[0], s[1]) == 0
  print()


def test_sort():
  print('--test sort--')
  from functools import cmp_to_key
  
  files = ['!abc.mp3', '#abc.mp3', '$abc.mp3', '@abc.mp3', '_abc.mp3', '0.mp3', '01.mp3', '01. abc.mp3', '02.mp3', '09.mp3', '9.mp3', '9.x.mp3',
       '10.mp3', '10.y.mp3', '123.mp3', 'abc.mp3', '-abc.mp3', 'abc1.mp3', 'abc1aa.mp3', 'abc1b.mp3', 'abc2.mp3', 'abc09.mp3', 'abc09a.mp3',
       'abc09af.mp3', 'abc09b.mp3', 'abc9.mp3', 'abc9a.mp3', 'abc9ab.mp3', 'abc9b.mp3', 'abc10.mp3', 'abc10b.mp3', 'abc10poi.mp3', 'abc10www.mp3',
       'abc11a.mp3', 'abc11abc.mp3', 'abc11eee12.mp3', 'abc11eee43.mp3', 'abc11eq.mp3', 'abc12a.mp3', 'abc12b.mp3', 'abc45.mp3', 'abc86.mp3',
       'abc97.mp3', 'abc99asdasd.mp3', 'abc889qweqwe.mp3', 'abc102345.mp3', 'abcd.mp3', 'ert.mp3']
  
  result = sorted(files, key=cmp_to_key(compare))
  for file in result:
    print(file)
  print()
  

def test():
  test_compare()
  test_compare2()
  test_sort()


test()
