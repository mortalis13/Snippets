#!/bin/bash

if [ $# -gt 0 ]
then
  echo --Params--
  echo $*
  echo $@
  echo first: $1
  echo
fi

dc=0
fc=0

path=/home/home

for file in `ls -l $path | cut -d ' ' -f1`
do
  case "$file" in
    d*)
    dc=`expr $dc + 1`
    ;;
    -*)
    fc=`expr $fc + 1`
    ;;
    *)
  esac
done

echo "Directories in '$path': $dc"
echo "Files in '$path': $fc"
echo

f1()
{
  echo "f1()"
  echo "Params [$#]: $*"
  
  if [ $1 = a ]
  then
    echo "First is 'a'"
  fi
}

f1 a bc d
