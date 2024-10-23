%{
    #include<stdio.h>
    #include<string.h>
    #include<ctype.h>
%}

%%
[a-zA-Z0-9_]+@[a-zA-Z0-9_]+[.][com|in|edu]+ {printf("%s is valid email",yytext);}
%%

int main()
{
    freopen("input.txt","r",stdin);
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}