#!/bin/bash

a=10
b=4

ar1[0]=2
ar1[1]=6
ar1[2]=1

declare -a ar2=(el1 el2 el3 el4)

declare -A ar3
ar3=([a]=23 [b]=41 [c]=5)

# ------------------

if [ $a -gt 4 ]
then
  echo "a > 4 [$a]"
elif [ $a -eq 0 ]
then
  echo "a = 0"
else
  echo "a <= 4 [$a]"
fi


if [ $b -ge 0 ]
then
  echo "b positive [$b]"
fi


if test -e /bin/bash
then
  echo "/bin/bash exists"
fi

if test ! -e /bin/qqq
then
  echo "/bin/qqq doesn't exist"
fi


echo
echo --Arrays--
echo "ar1: [${ar1[@]}]"

echo "Size ar2: ${#ar2[@]}"
echo "ar2: [${ar2[*]}]"

echo
echo "Size ar3: ${#ar3[@]}"
echo "ar3: [${ar3[*]}]"
echo "ar3[a]: ${ar3[a]}"
echo "ar3[b]: ${ar3[b]}"
echo "ar3[c]: ${ar3[c]}"


echo
echo --Loop--

for i in ${ar1[*]}
do
  echo $i
done
echo

for num in {5..10}
do
  echo -n "$num "
done
echo
echo

echo =one_line=
for num in {3..20..3}; do echo $num; done
echo

echo =files=
echo -----
for f in /*
do
  if [ -d $f ]
  then
    echo $f
  fi
done
echo

for f in `ls /`
do
  echo = $f
done
echo

for i in `ls -1 /`;do echo - $i;done
echo
