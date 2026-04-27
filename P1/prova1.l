%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%option yylineno
%option noyywrap

%%

\n                  ;

[ \t\r]+            ;

\\[^\n]*    ;

"print"             { return PRINT; }
"concat"            { return CONCAT; }
"length"            { return LENGTH; }

[0-9]+ {
    yylval.num = atoi(yytext);
    return NUMBER;
}

\"[^\"]*\" {
    yylval.str = strdup(yytext);
    return STRING;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return ID;
}

"="                 return '=';
","                 return ',';
"("                 return '(';
")"                 return ')';


%%
