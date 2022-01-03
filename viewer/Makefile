all: viewer.bin

viewer.bin: viewer.out
	arm-none-eabi-objcopy -O binary viewer.out viewer.bin

viewer.out: viewer.o
	arm-none-eabi-ld --oformat elf32-littlearm -o viewer.out -T viewer.ls viewer.o -b binary shuttle.gba

viewer.o: viewer.s
	arm-none-eabi-cpp viewer.s | arm-none-eabi-as -o viewer.o -

clean:
	rm -rf viewer.o viewer.out viewer.bin

transfer: viewer.bin
	sudo ../optusb/optusb viewer.bin