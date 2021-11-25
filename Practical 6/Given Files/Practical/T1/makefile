O_FILES = alloc.o main.o

a.out: $(O_FILES)
	gcc $(O_FILES) -o a.out -g -m64 -static

main.o: main.c
	gcc -c main.c -g -m64

alloc.o: alloc.asm
	yasm -f elf64 -g dwarf2 alloc.asm -o alloc.o

run: a.out
	./a.out

clean:
	rm -rf *.o a.out
