a.out: main.o funct.o
	gcc main.o funct.o -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

funct.o: funct.asm
	yasm -f elf64 -g dwarf2 funct.asm -o funct.o