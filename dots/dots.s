// My first GBA video drawing program

.arm
.text

  mov r1, #0x04000000 // Set I/O base address
  ldr r2, =0xF03      // Set video mode 3
  strh r2, [ r1 ]     // Update display control register
  mov r3, #0x06000000 // Set VRAM frame buffer address
  ldr r4, =0x7FFF     // RGB = 1F/1F/1F --> white
  strh r4, [ r3 ]
  strh r4, [ r3, #4 ]
  strh r4, [ r3, #8 ]
  strh r4, [ r3, #12 ]
  strh r4, [ r3, #16 ]
  strh r4, [ r3, #20 ]
loop:
  b loop
