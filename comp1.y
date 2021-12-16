%{
#include <stdio.h>
  double Symtbl[4];
%}
%union{
  double val;
}
%token <val> NUM  ID
%type <val> Expr
%token LPA RPA EQU PRT SEM
%left ADD SUB
%left DIV MUL MOD
%start Program
%%
Program: Statement
       | Program Statement
;
Statement: Assign 
         | Print
;
Assign: ID EQU Expr SEM
{
  Symtbl[(int)($1)]=$3;
}
;
Print: PRT ID SEM
{
  printf("%f\n", Symtbl[(int)($2)]);
}
;
Expr: Expr ADD Expr {$$=$1+$3;}
| Expr SUB Expr {$$=$1-$3;}
| Expr MOD Expr {$$=(int)$1%(int)$3;}
| Expr MUL Expr {$$=$1*$3;}
| Expr DIV Expr {$$=$1/$3;}
| LPA Expr RPA {$$=$2;}
| NUM {$$=$1;}
| ID {$$=Symtbl[(int)($1)];}
;
%%
int main(){
  yyparse();
}
int yyerror(char *s)
{ /* 定義要 */
}

