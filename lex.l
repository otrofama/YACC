%{
#include <stdio.h>
#include "y.tab.h"
#include <stdlib.h>
%}


digito [0-9]
integer {digito}+
white [ \t]+

%%
{white} {}

{integer} {
	yylval.ival=atoi(yytext);
	return NUM;}

"+" {return MAS;}
"*" {return MUL;}
"(" {return LPAR;}
")" {return RPAR;}
%%

