%{
#include <stdio.h>
#include "y.tab.h"
#include <stdlib.h>
%}


digito [0-9]

%%

{digito}+ {return NUM;}

"+" {return MAS;}
"*" {return MUL;}
"(" {return LPAR;}
")" {return rPAR;}

int yywrap()
{
	return 1;
}
