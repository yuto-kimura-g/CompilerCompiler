#! /bin/bash

echo "\n> compiler compiler\n"
rm *.c *.h
ls -la
echo "\n"

echo "> bison -d comp1.y"
bison -d comp1.y
ls -la
echo "\n"

echo "> flex comp1.lex"
flex comp1.lex
ls -la
echo "\n"

echo "> gcc lex.yy.c comp1.tab.c -w"
gcc lex.yy.c comp1.tab.c -w
ls -la
echo "\n"

