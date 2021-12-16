# Compiler repo

2年後期配当科目/コンパイラ・インタプリタ/コンパイラコンパイラ

using `bison/flex`

<br>

## Usage

```shell
$ sudo apt update
$ sudo apt install bison -y
$ sudo apt install flex -y

$ bison -d comp1.y
$ flex comp1.lex
$ gcc lex.yy.c comp1.tab.c -w

$ ./a.out
# if you want to quit, press Ctrl+C
```

