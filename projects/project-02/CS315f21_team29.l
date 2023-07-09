sign [-+]
lowercase_letter [a-z]
uppercase_letter [A-Z]
letter [A-Za-z]
digit [0-9]
type ("int"|"db"|"str"|"bool")
%%
"readHeading" return READ_HEADING;
"readAltitude" return READ_ALTITUDE;
"readTemperature" return READ_TEMPERATURE;
"climbUp" return CLIMB_UP;
"dropDown" return DROP_DOWN;
"stopVertical" return STOP_VERTICAL;
"moveForward" return MOVE_FORWARD;
"moveBackward" return MOVE_BACKWARD;
"stopHorizontal" return STOP_HORIZONTAL;
"turnHeadingRight" return TURN_HEADING_RIGHT;
"turnHeadingLeft" return TURN_HEADING_LEFT;
"sprayOn" return SPRAY_ON;
"sprayOff" return SPRAY_OFF;
"connectToBase" return CONNECT_TO_BASE;
"readHorizontalSpeed" return READ_HORIZONTAL_SPEED;
"readVerticalSpeed" return READ_VERTICAL_SPEED;
"hitSide" return HIT_SIDE;
"main" return MAIN;
[+] return ADD_OP;
[-] return SUB_OP;
[*] return MULT_OP;
[/] return DIV_OP;
[%] return REM_OP;
[.] return DOT;
[,] return COMMA;
[;] return SEMICOLON;
[(] return LP;
[)] return RP;
[[] return LSB;
[]] return RSB;
[{] return LB;
[}] return RB;
[>] return GREATER_THAN;
[<] return LESS_THAN;
"^" return NOT;
"<-" return ASSIGN_OP;
"<=>" return EQUAL_OP;
"<^=>" return NOT_EQUAL_OP;
">=" return GREATER_OR_EQUAL;
"<=" return LESS_OR_EQUAL;
\n {extern int lineno; lineno++; return NL;}
[&] return AND_OP;
[|] return OR_OP;
["].*["] return STRING_SENTENCE;
"##".* return COMMENT;
"else if" return ELSE_IF;
if return IF;
else return ELSE;
const return CONST;
while return WHILE;
for return FOR;
take return INPUT_CALL;
display return OUTPUT_CALL;
define return FUNCTION_DEF;
return return FUNCTION_RETURN;
{digit}+ return INTEGER_VALUE;
{type} return DATA_TYPE;
{sign}?{digit}*(\.)?{digit}+ return DOUBLE_VALUE;
{lowercase_letter}|({lowercase_letter}({lowercase_letter}|{digit}|_)*({lowercase_letter}|{digit})) return VAR_IDENTIFIER;
{uppercase_letter}|({uppercase_letter}({uppercase_letter}|{digit}|_)*({uppercase_letter}|{digit})) return CONST_IDENTIFIER;
{lowercase_letter}|({lowercase_letter}({letter}|{digit})*) return FUNCT_IDENTIFIER;
. ;
%%
int yywrap() {return 1;}
