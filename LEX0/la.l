%{
    int COMMENT = 0;
%}

identifier [a-zA-Z][a-bA-Z0-9]*

%%
#.* {printf(" %s is PREPROCESSOR DIRECTIVE", yytext);}
main |
int |
void |
float |
char |
double |
bool |
if |
else |
continue |
goto |
break |
for |
while |
do |
struct |
typedef
return {printf("\n\t%s is KEYWORD",yytext);}
"/*" {COMMENT = 1;}{printf("\n\t%s is a COMMENT",yytext);}
{identifier} {printf("\n\t%s is an IDENTIFIER.",yytext);}
{identifier}\( {if(!COMMENT);} {printf("\n\t%s is a FUNCTION",yytext);}
\{ {printf("BLOCK BEGINS");}
\} {printf("BLOCK ENDS");}
{identifier}(\[[0-9]*\])? {printf("\n\t%s is an IDENTIFIER",yytext);}
\".*\" {if(!COMMENT);} {printf("\n\t%s is a STRING",yytext);}
[0-9]+ {if(!COMMENT);} {printf("\n\t%s is a NUMBER",yytext);}
= {printf("\n\t%s is the ASSIGNMENT OPERATOR",yytext);}
== |
\< |
\> |
\<= |
\>= {printf("\n\t%s it is a RELATIONAL OPERATOR",yytext);}
%%

int main()
{
    FILE *file = fopen("var.c","r");
    if(!file)
    {
        printf("couldn't open file");
        exit(0);
    }
    yyin = file;
    yylex();
    printf("\n");
    return(0);
}

int yywrap()
{
    return(1);
}