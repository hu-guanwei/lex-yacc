%{
#include <stdio.h>    
#include "y.tab.h"
%}


FIELD_NAME     ([A-Z]{2,}[A-Z_0-9]+[A-Z0-9]{2,})|SUMMARY
SEPRATOR       [_]


STATIC_NORMAL_PREFIX  StaticNormal
STATIC_SUFFIX         cate_idx|num
AGGRAMT               AggrAmt_agg

STATIC_ADDR_PREFIX    StaticAddressDerive
STATIC_ADDR_SUFFIX   -(district|city|province)

AGGR_STAT   count|sum
NUM_STAT    Avg|Std|Max|Min|Sum|Quar[0-9]{2,}|Ptp|Cv|Skew|Kur|MeanAbsDev|Iqr
%%

{STATIC_ADDR_PREFIX}   { yylval.str = strdup(yytext); return STATIC_ADDR_PREFIX;}
{STATIC_NORMAL_PREFIX} { yylval.str = strdup(yytext); return STATIC_NORMAL_PREFIX;}
{AGGRAMT}              { yylval.str = strdup(yytext); return AGGRAMT;    }

{STATIC_ADDR_SUFFIX}   { yylval.str = strdup(yytext); return STATIC_ADDR_SUFFIX;}
{STATIC_SUFFIX}        { yylval.str = strdup(yytext); return STATIC_SUFFIX;}
{FIELD_NAME}    { yylval.str = strdup(yytext); return FIELD_NAME; }
{AGGR_STAT}     { yylval.str = strdup(yytext); return AGGR_STAT;  }
{NUM_STAT}      { yylval.str = strdup(yytext); return NUM_STAT;   }
{SEPRATOR}      { return SEPRATOR;   }
.               { printf("othres: %s\n", yytext);}
%%