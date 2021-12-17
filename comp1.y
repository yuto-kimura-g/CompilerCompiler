%{
#include <stdio.h>
#include <math.h>
  double Symtbl[10];
%}
%union{
  double dval;
  int ival;
}
%token <dval> NUM  ID
%type <dval> Expr
%token LPA RPA EQU PRT MAXPRT MINPRT EXP LOG ABS SQRT COM SEM
%left ADD SUB
%left DIV MUL MOD
%left MAX
%start Program
%%
Program: Statement
       | Program Statement
;
Statement: Assign 
         | Print
         | MaxPrint
         | MinPrint
;
Assign: ID EQU Expr SEM
{
  Symtbl[(int)($1)]=$3;
}
;
Print: PRT Expr SEM
{
  printf("expr:%f\n", $2);
}
;
MaxPrint: MAXPRT Expr COM Expr SEM
{
  printf("max:%f\n", fmax($2,$4));
}
;
MinPrint: MINPRT Expr COM Expr SEM
{
  printf("min:%f\n", fmin($2,$4));
}
;
Expr: Expr ADD Expr {$$=$1+$3;}
    | Expr SUB Expr {$$=$1-$3;}
    | Expr MOD Expr {$$=(int)$1%(int)$3;}
    | Expr MUL Expr {$$=$1*$3;}
    | Expr DIV Expr {$$=$1/$3;}
    | Expr MAX Expr {$$=($1 >= $3) ? $1:$3;}
    | LPA Expr RPA {$$=$2;}
    | EXP LPA Expr RPA {$$=exp($3);}
    | LOG LPA Expr RPA {$$=log($3);}
    | ABS LPA Expr RPA {$$=fabs($3);}
    | SQRT LPA Expr RPA {$$=sqrt($3);}
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

