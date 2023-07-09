parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f21_team29.y lex.yy.c
	yacc CS315f21_team29.y
lex.yy.c: CS315f21_team29.l
	lex CS315f21_team29.l
clean:
	rm -f lex.yy.c y.tab.c parser
