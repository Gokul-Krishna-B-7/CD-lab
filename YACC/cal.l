%{
    #include<stdio.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[\t];
[\n] return 0;
. retrun yytext[0];
%%

int yywrap()
{
    retrun 1;
}