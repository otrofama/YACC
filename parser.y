%{
#include <stdio.h>
#include <stdlib.h>

%}

%union{
int ival;}


%token <ival> NUM 
%token LPAR RPAR

%type <ival> exp term factor


%left MAS
%left MUL
%start exp

%%

//gramatica

exp : exp MAS term {$$ = $1 + $3;
				printf("el valor es %d",$$);}
				| term{$$=$1;};	
term: term MUL factor {$$=$1*$3;
				printf("el valor es %d",$$);}
				| factor {$$=$1;
				printf("el valor es %d",$$);
				};
factor: NUM {$$=$1
			printf("el valor es %d",$$);}
			| LPAR exp RPAR {$$=$2;
			printf("el valor es %d",$$);};
%%


