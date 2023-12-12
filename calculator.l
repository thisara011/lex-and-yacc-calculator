%{
#include "y.tab.h"
%}

%%

[0-9]+      {
    yylval = atoi(yytext);
    return NUM;
}

sin         { return SIN; }
cos         { return COS; }
tan         { return TAN; }
log         { return LOG; }
sqrt        { return SQRT; }

[-+\*/%\n]  { return *yytext; }
[ \t]       ;
.           ;

%%

int yywrap() {
    return 1;
}

