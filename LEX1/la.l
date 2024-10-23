%{
    #include<stdio.h>
    int vow_count =0;
    int con_count =0;
%}

%%
[aeiouAEIOU] {vow_count++;}
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] {con_count++;}
[%,;?]
[\t\n]
%%

int main()
{
    FILE *file = fopen("input.txt","r");
    if(!file){
        perror("Error opening file.");
        return 1;
    }
    yyin = file;
    yylex();
    printf("Vowel = %d and consonant = %d\n",vow_count,con_count);
    fclose(file);
}

int yywrap()
{
    return 1;
}