%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%union {
    char *str;
    char *type;
};

%token AGGRAMT FIELD_NAME SEPRATOR AGGR_STAT NUM_STAT STATIC_NORMAL_PREFIX STATIC_SUFFIX
%token STATIC_ADDR_PREFIX STATIC_ADDR_SUFFIX

%%
feature_name: aggramt 
            | static_normal
            | static_address_derive
            ;
            
aggramt: AGGRAMT    SEPRATOR 
         FIELD_NAME SEPRATOR FIELD_NAME
         AGGR_STAT  SEPRATOR 
         FIELD_NAME SEPRATOR
         NUM_STAT
       ;

static_normal: STATIC_NORMAL_PREFIX SEPRATOR 
               FIELD_NAME           SEPRATOR
               STATIC_SUFFIX           
             ; 

static_address_derive: STATIC_ADDR_PREFIX SEPRATOR 
                       FIELD_NAME         
                       STATIC_ADDR_SUFFIX SEPRATOR
                       STATIC_SUFFIX
                       {printf("%s %s %s %s", $<str>1, $<str>3, $<str>4, $<str>6);}
                      ;
//StaticAddressDerive_OI04_AA_ADD4-city_cate_idx



%%