%{
#include <stdio.h>
#include <stdlib.h>
%}


%token READ_HEADING
%token READ_ALTITUDE
%token READ_TEMPERATURE
%token CLIMB_UP
%token DROP_DOWN
%token STOP_VERTICAL
%token MOVE_FORWARD
%token MOVE_BACKWARD
%token STOP_HORIZONTAL
%token TURN_HEADING_RIGHT
%token TURN_HEADING_LEFT
%token SPRAY_ON
%token SPRAY_OFF
%token CONNECT_TO_BASE
%token READ_HORIZONTAL_SPEED
%token READ_VERTICAL_SPEED
%token HIT_SIDE
%token ADD_OP
%token CONST
%token SUB_OP
%token MULT_OP
%token DIV_OP
%token REM_OP
%token DOT
%token COMMA
%token SEMICOLON
%token LP
%token RP
%token LSB
%token RSB
%token LB
%token RB
%token GREATER_THAN
%token LESS_THAN
%token NOT
%token ASSIGN_OP
%token EQUAL_OP
%token NOT_EQUAL_OP
%token GREATER_OR_EQUAL
%token LESS_OR_EQUAL
%token NL
%token AND_OP
%token OR_OP
%token STRING_SENTENCE
%token COMMENT
%token ELSE_IF
%token IF
%token ELSE
%token WHILE
%token FOR
%token INPUT_CALL
%token OUTPUT_CALL
%token FUNCTION_DEF
%token FUNCTION_RETURN
%token INTEGER_VALUE
%token DATA_TYPE
%token DOUBLE_VALUE
%token VAR_IDENTIFIER
%token CONST_IDENTIFIER
%token FUNCT_IDENTIFIER
%token MAIN


%left ADD_OP SUB_OP
%left MULT_OP DIV_OP REM_OP
%left LP RP

%start program

%%
/* Program Definitions */
program: main nl_block | funct_decleration nl_block | program funct_decleration nl_block;

main: MAIN LP RP LB statement_list RB;

statement_list: /* nothing */ | statement | statement_list statement;

statement: NL | var_decleration SEMICOLON | const_decleration SEMICOLON | assignment SEMICOLON | condition | loop | funct_call SEMICOLON | comment | input SEMICOLON | output SEMICOLON | funct_decleration;

non_if_statement: var_decleration SEMICOLON | const_decleration SEMICOLON | assignment SEMICOLON | loop | funct_call SEMICOLON | comment | input SEMICOLON | output SEMICOLON | funct_decleration;

/* Declarations */
var_decleration: DATA_TYPE assignment | DATA_TYPE VAR_IDENTIFIER;

const_decleration: CONST DATA_TYPE CONST_IDENTIFIER ASSIGN_OP expression | CONST DATA_TYPE CONST_IDENTIFIER ASSIGN_OP CONST_IDENTIFIER | CONST DATA_TYPE CONST_IDENTIFIER ASSIGN_OP VAR_IDENTIFIER | CONST DATA_TYPE CONST_IDENTIFIER ASSIGN_OP input;

assignment: VAR_IDENTIFIER ASSIGN_OP VAR_IDENTIFIER | VAR_IDENTIFIER ASSIGN_OP expression | VAR_IDENTIFIER ASSIGN_OP input | VAR_IDENTIFIER ASSIGN_OP funct_call;

/* Expressions */
expression: relational_expression | arithmetic_expression;

arithmetic_expression: iarithmetic | rarithmetic;

iarithmetic: INTEGER_VALUE | funct_call | VAR_IDENTIFIER | CONST_IDENTIFIER | iarithmetic ADD_OP iarithmetic | iarithmetic SUB_OP iarithmetic | iarithmetic MULT_OP iarithmetic | iarithmetic DIV_OP iarithmetic | iarithmetic REM_OP iarithmetic | LP iarithmetic RP;

rarithmetic: rarithmetic ADD_OP rarithmetic
     | rarithmetic SUB_OP rarithmetic
     | rarithmetic MULT_OP rarithmetic
     | rarithmetic DIV_OP rarithmetic
     | rarithmetic REM_OP rarithmetic
     | LP rarithmetic RP
     | DOUBLE_VALUE
     | iarithmetic ADD_OP rarithmetic
     | iarithmetic SUB_OP rarithmetic
     | iarithmetic MULT_OP rarithmetic
     | iarithmetic DIV_OP rarithmetic
     | rarithmetic REM_OP rarithmetic
     | rarithmetic ADD_OP iarithmetic
     | rarithmetic SUB_OP iarithmetic
     | rarithmetic MULT_OP iarithmetic
     | rarithmetic DIV_OP iarithmetic
     | rarithmetic REM_OP rarithmetic;

relational_expression: relational_expression LESS_THAN relational_expression
     | NOT relational_expression
     | relational_expression GREATER_THAN relational_expression
     | relational_expression LESS_OR_EQUAL relational_expression
     | relational_expression GREATER_OR_EQUAL relational_expression
     | relational_expression EQUAL_OP relational_expression
     | relational_expression NOT_EQUAL_OP relational_expression
     | relational_expression AND_OP relational_expression
     | relational_expression OR_OP relational_expression | VAR_IDENTIFIER | CONST_IDENTIFIER | funct_call | INTEGER_VALUE | DOUBLE_VALUE;


/* Conditional Statements */
condition: matched | unmatched;

matched: IF relational_expression matched ELSE matched | LB non_if_statement RB;

unmatched: IF relational_expression LB statement_list RB | IF relational_expression matched ELSE unmatched;

/* Loops */
loop: for_loop | while_loop;

for_loop: FOR assignment COMMA relational_expression COMMA assignment LB statement_list RB;

while_loop: WHILE relational_expression LB statement_list RB;

/* Comments */
comment: COMMENT;

nl_block: /* nothing */ | NL | nl_block NL;

/* Input and Output Statements */
output: OUTPUT_CALL LP expression RP | OUTPUT_CALL LP funct_call RP | OUTPUT_CALL LP STRING_SENTENCE RP;

input: INPUT_CALL LP RP;

/* Function Calls */
funct_call: FUNCT_IDENTIFIER LP arg_list RP
          | READ_HEADING LP arg_list RP
          | READ_ALTITUDE LP arg_list RP
          | READ_TEMPERATURE LP arg_list RP
          | CLIMB_UP LP arg_list RP
          | DROP_DOWN LP arg_list RP
          | STOP_VERTICAL LP arg_list RP
          | MOVE_FORWARD LP arg_list RP
          | MOVE_BACKWARD LP arg_list RP
          | STOP_HORIZONTAL LP arg_list RP
          | TURN_HEADING_RIGHT LP arg_list RP
          | TURN_HEADING_LEFT LP arg_list RP
          | SPRAY_ON LP arg_list RP
          | SPRAY_OFF LP arg_list RP
          | CONNECT_TO_BASE LP arg_list RP
          | READ_HORIZONTAL_SPEED LP arg_list RP
          | READ_VERTICAL_SPEED LP arg_list RP
          | HIT_SIDE LP arg_list RP;

arg_list: /* empty */ | VAR_IDENTIFIER | CONST_IDENTIFIER | arg_list COMMA arg_list;

/* Function Definition */
funct_decleration: FUNCTION_DEF DATA_TYPE FUNCT_IDENTIFIER LP param_list RP LB statement_list FUNCTION_RETURN VAR_IDENTIFIER SEMICOLON RB
  | FUNCTION_DEF DATA_TYPE FUNCT_IDENTIFIER LP param_list RP LB statement_list FUNCTION_RETURN INTEGER_VALUE SEMICOLON RB;

param_list: /* empty */ | DATA_TYPE VAR_IDENTIFIER | DATA_TYPE CONST_IDENTIFIER | param_list COMMA param_list;




%%
#include "lex.yy.c"
int lineno;

int main(void){
 yyparse();
if(yynerrs < 1){
		printf("Input Program is Valid!\n");
	}
 return 0;
}

void yyerror( char *s ) { printf( "Syntax error on line: %d!\n", (lineno + 1)); };
