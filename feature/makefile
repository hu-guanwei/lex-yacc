a.out:  y.tab.c lex.yy.c
	gcc lex.yy.c y.tab.c -ly -ll
lex.yy.c: scanner.l 
	lex -o lex.yy.c scanner.l 
y.tab.c: grammar.y
	yacc -d grammar.y
clean:
	rm *.c *.h *.gch