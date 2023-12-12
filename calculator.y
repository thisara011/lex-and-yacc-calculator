%{
#include <stdio.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
%}

%token NUM
%token SIN COS TAN LOG SQRT

%left '+' '-'
%left '*' '/'
%left '%'
%nonassoc UMINUS

%%

input:
     | input expr '\n' { printf("Valid arithmetic expression\n"); }
     ;

expr: NUM
    | SIN '(' expr ')'   { $$ = sin($3 * M_PI / 180.0); }
    | COS '(' expr ')'   { $$ = cos($3 * M_PI / 180.0); }
    | TAN '(' expr ')'   { $$ = tan($3 * M_PI / 180.0); }
    | LOG '(' expr ')'   { $$ = log($3); }
    | SQRT '(' expr ')'  { $$ = sqrt($3); }
    | expr '+' expr      { $$ = $1 + $3; }
    | expr '-' expr      { $$ = $1 - $3; }
    | expr '*' expr      { $$ = $1 * $3; }
    | expr '/' expr      { $$ = $1 / $3; }
    | expr '%' expr      { $$ = (int)$1 % (int)$3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    ;

%%

void yyerror(const char *s) {
    printf("Invalid arithmetic expression: \n");
}

int main() {
    printf("Enter Any Arithmetic Expression: \n");
    yyparse();
    return 0;
}

