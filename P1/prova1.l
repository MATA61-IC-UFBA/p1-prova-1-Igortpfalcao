%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

[0-9]+(\.[0-9]+)?   { return NUM; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIV; }
\n                  { return EOL; }
[ \t]+              { /* ignora espacos em branco */ }
.                   { return ERROR; }


%%
