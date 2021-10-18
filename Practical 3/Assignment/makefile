task3: task3.asm
	yasm -f elf64 -g dwarf2 -l task3.lst -o task3.o task3.asm
	mkdir -p bin
	ld -o bin/task3 task3.o

run: task3
	./bin/task3

clean:
	rm -f *.o
	rm -fr bin/
