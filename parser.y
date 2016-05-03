%{
#include <stdio.h>
#include <stdlib.h>
%}

%union{
	int ival;
}


%token <ival> NUM 
%token LPAR RPAR
%type <ival> exp term factor


%left MAS
%left MUL
%start exp

%%

//gramatica

exp: exp MAS term {$$ = $1 + $3;
				printf("el valor es1 %d\n",$$);}
				| term {$$=$1;
				printf("el valor es2 %d\n",$$);
				};
term: term MUL factor {$$=$1*$3;
				printf("el valor es3 %d\n",$$);}
				| factor {$$=$1;
				printf("el valor es4 %d\n",$$);
				};
factor: NUM {$$=$1;
			printf("el valor es5 %d\n",$$);}
			| LPAR exp RPAR {$$=$2;
			printf("el valor es6 %d\n",$$);
			};
%%

int yyerror(char *s)
{ 
	printf("%s\n",s); 
} 
int main(int argc, char const *argv[])
{
	yyparse();
	return 0;
}