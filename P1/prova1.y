%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex(); 
int yyerror(const char *s);
%}

%union {
    int num;
    char *str;
}

%token PRINT CONCAT LENGTH
%token <num> NUMBER
%token <str> STRING ID

%start program

%%

program
: stmt_list
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: ID '=' expr
| PRINT '(' expr ')'
;

expr
: NUMBER
| STRING
| ID
| LENGTH '(' expr ')'
| CONCAT '(' expr ',' expr ')'
;

%%
