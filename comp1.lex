%{
#include "comp1.tab.h"
%}
%%
"\n" {;} /* 改行を無視  */
" " {;}  /* スペースを無視  */
"\t" {;} /* タブを無視  */

print return(PRT);
"=" return(EQU); 
"+" return(ADD); 
"-" return(SUB); 
"*" return(MUL); 
"/" return(DIV); 
"%" return(MOD); 
"(" return(LPA); 
")" return(RPA); 
";" return(SEM); 
"A" { yylval.val=0.0;
 return (ID);}
"B" { yylval.val=1.0;
 return (ID);}
"C" { yylval.val=2.0;
 return (ID);}
"D" { yylval.val=3.0;
 return (ID);}
[0-9]+ {yylval.val=atof(yytext);
 return (NUM);}
%%
int yywrap(){ /* 定義要 */ return 1;}

