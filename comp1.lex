%{
#include "comp1.tab.h"
%}
%%
"\n" {;} /* 改行を無視  */
" " {;}  /* スペースを無視  */
"\t" {;} /* タブを無視  */

print return(PRT);
maxprint return(MAXPRT);
minprint return(MINPRT);
exp return(EXP);
log return(LOG);
abs return(ABS);
sqrt return(SQRT);
"=" return(EQU); 
"+" return(ADD); 
"-" return(SUB); 
"*" return(MUL); 
"/" return(DIV); 
"%" return(MOD); 
"#" return(MAX); 
"(" return(LPA); 
")" return(RPA); 
"," return(COM); 
";" return(SEM); 
"A" {
    yylval.dval=0.0;
    return (ID);
}
"B" {
    yylval.dval=1.0;
    return (ID);
}
"C" {
    yylval.dval=2.0;
    return (ID);
}
"D" {
    yylval.dval=3.0;
    return (ID);
}
"XX" {
    yylval.dval=4.0;
    return (ID);
}
"YY" {
    yylval.dval=5.0;
    return (ID);
}
[0-9]+ {
    yylval.dval=atof(yytext);
    return (NUM);
}
%%
int yywrap(){ /* 定義要 */ return 1;}

