power.bin : power.o
	ld power.o -o power.bin

power.o : power.asm
	 yasm -g dwarf2 -f elf64 power.asm -l power.lst

clean:
	rm -rf *.bin *.o *.lst
