%option main
sign [-+]
lowercase_letter [a-z]
uppercase_letter [A-Z]
letter [A-Za-z]
digit [0-9]
type ("int"|"db"|"str"|"bool")
primitive_funct ("read_heading"|"read_altitude"|"read_temperature"|"climb_up"|"drop_down"|"stop_vertical"|"move_forward"|"move_backward"|"stop_horizontal"|"turn_heading_right"|"turn_heading_left"|"spray_on"|"spray_off"|"connect_to_base"|"read_horizontal_speed"|"read_vertical_speed")
%%
[+] printf(" ADD_OP ");
[-] printf(" SUB_OP ");
[*] printf(" MULT_OP ");
[/] printf(" DIV_OP ");
[%] printf(" REM_OP ");
[.] printf(" DOT ");
[,] printf(" COMMA ");
[;] printf(" SEMICOLON ");
[(] printf(" LP ");
[)] printf(" RP ");
[[] printf(" LSB ");
[]] printf(" RSB ");
[{] printf(" LB ");
[}] printf(" RB ");
[>] printf(" GREATER_THAN ");
[<] printf(" LESS_THAN ");
"^" printf(" NOT ");
"<-" printf(" ASSIGN_OP ");
"<=>" printf(" EQUAL_OP ");
"<^=>" printf(" NOT_EQUAL_OP ");
">=" printf(" GREATER_OR_EQUAL ");
"<=" printf(" LESS_OR_EQUAL ");
\n printf("\n");
[&] printf(" AND_OP ");
[|] printf(" OR_OP ");
["].*["] printf(" STRING_SENTENCE ");
"##".* printf(" COMMENT ");
if printf(" IF ");
else printf(" ELSE ");
while printf(" WHILE ");
for printf(" FOR ");
take printf(" INPUT_CALL ");
display printf(" OUTPUT_CALL ");
define printf(" FUNCTION_DEF ");
return printf(" FUNCTION_RETURN ");
{digit}+ printf(" NUMBER ");
{type} printf(" DATA_TYPE ");
{primitive_funct} printf(" PRIMITIVE_FUNCTION ");
{sign}?{digit}*(\.)?{digit}+ printf(" DOUBLE_VALUE ");
{lowercase_letter}|({lowercase_letter}({lowercase_letter}|{digit}|_)*({lowercase_letter}|{digit})) printf(" IDENTIFIER ");
%%
