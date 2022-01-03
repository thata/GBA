all: rgb.bin

rgb.bin: rgb.out
	arm-none-eabi-objcopy -O binary rgb.out rgb.bin

rgb.out: rgb.o
	arm-none-eabi-ld -o rgb.out -T ../simple.ls rgb.o

rgb.o: rgb.s
	arm-none-eabi-cpp rgb.s | arm-none-eabi-as -o rgb.o -

clean:
	rm -rf rgb.o rgb.out rgb.bin

transfer: rgb.bin
	sudo ../optusb/optusb rgb.bin
