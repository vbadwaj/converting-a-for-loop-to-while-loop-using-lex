%option noyywrap
%{
#include<stdio.h>
int flag=0,check;
char buff[50],str;
//extern FILE *yyin,*yyout;
%}

%%
for+"("+[a-z|A-Z]*+"="[0-9]*+";"+[a-z|A-Z]*+("<"|"<="|">"|">="|"=="|"!=")+[a-z|A-Z|0-9]*+";"+[a-z|A-Z]*+("++"|"--"|"+"|"-")+[a-z|A-Z|0-9]*+")"+"{"+[a-z|A-Z|0-9|=|+|(|)|*|-|?|%|"|']*";"+"}" {
printf("It is a for loop\n");
printf("The *WHILE* construct for the same will be :\n");
while(yytext[check]!='('){
check++;
}

        check++;
        printf("int");
        for(;yytext[check]!=';';check++){
                printf(" %c",yytext[check]);
        }
        printf(";");
        printf("\n");
        printf("while(");

        check++;

        for(;yytext[check]!=';';check++){
        printf("%c",yytext[check]);
        }
        while(yytext[check]!=';'){
        check++;
        }


        check++;

        printf(")");
        //printf("{\n");
        printf("\n");
        while(yytext[check]!='{'){
        check++;        }
        for(;yytext[check]!='}';check++){
        printf("%c",yytext[check]);
        }
        for(check=0;yytext[check]!=';';check++);
        check++;
        for(;yytext[check]!=';';check++);
        check++;
        printf("\n");
        for(;yytext[check]!=')';check++){
        printf("%c",yytext[check]);
        }
        printf(";\n }");



}






.+ {
printf("Not a for loop\n");
}
%%
int main(){
/*extern FILE *yyin,*yyout;
yyin=fopen("forinput.txt","r");
yyout=fopen("foroutput.txt","a");
fp=fopen("forinput.txt","r");*/
yylex();
return 0;
}
                       