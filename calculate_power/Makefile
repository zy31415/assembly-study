power : power.o
	ld power.o -o power

power.o : power.asm
	 yasm -g dwarf2 -f elf64 power.asm -l power.lst

clean:
	rm -rf power *.o *.lst
