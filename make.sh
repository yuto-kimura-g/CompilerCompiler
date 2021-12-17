#! /bin/bash

echo "\n> compiler compiler\n"
rm *.out *.exe *.c *.h

set -eu

echo "> bison -d comp1.y"
bison -d comp1.y
ls -lat
echo "\n"

echo "> flex comp1.lex"
flex comp1.lex
ls -lat
echo "\n"

echo "> gcc lex.yy.c comp1.tab.c -w -lm"
gcc lex.yy.c comp1.tab.c -w -lm
rm *.c *.h
ls -lat
echo "\n"

