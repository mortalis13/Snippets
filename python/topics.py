# Comprehensions
[x for x in range(1,6)]
[x for x in range(1,6) if x%2==1]
[(row, col) for row in range(1,5) for col in range(1,3)]

lst=['a','b','c','b','f','b','a']
{x: lst.count(x) for x in lst}

{x for x in [1,1,2,3,4,3,3]}

# -- generator
num_gen = (x for x in range(1,1000))
[a for a in num_gen]


# Lambda
pwr2 = lambda x: x**2
pwr2(8)

list( map(lambda x: x*2, [2,3,8,7]) )
