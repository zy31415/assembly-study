sum.bin : sum.o
	ld sum.o -o sum.bin

sum.o : sum.asm
	 yasm -g dwarf2 -f elf64 sum.asm -l sum.lst

clean:
	rm -rf *.bin *.o *.lst
