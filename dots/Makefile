all: dots.bin

dots.bin: dots.out
	arm-none-eabi-objcopy -O binary dots.out dots.bin

dots.out: dots.o
	arm-none-eabi-ld -o dots.out -T ../simple.ls dots.o

dots.o: dots.s
	arm-none-eabi-cpp dots.s | arm-none-eabi-as -o dots.o -

clean:
	rm -rf dots.o dots.out dots.bin

transfer: dots.bin
	sudo ../optusb/optusb dots.bin
