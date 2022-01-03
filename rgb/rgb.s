.arm
.text

  mov r1, #0x04000000 // Set I/O base address
  ldr r2, =0xF03      // Set video mode 3
  strh r2, [ r1 ]     // Update display control register

  mov r3, #0x06000000 // Set VRAM frame buffer address

  mov r5, #12800
  ldr r4, =0x001F     // RGB = 00/00/1F --> red
display_red:
  strh r4, [r3]
  add r3, r3, #2
  subs r5, r5, #1
  bne display_red

  mov r5, #12800
  ldr r4, =0x03E0     // RGB = 00/1F/00 --> green
display_green:
  strh r4, [r3]
  add r3, r3, #2
  subs r5, r5, #1
  bne display_green

  mov r5, #12800
  ldr r4, =0x7C00     // RGB = 1F/00/00 --> blue
display_blue:
  strh r4, [r3]
  add r3, r3, #2
  subs r5, r5, #1
  bne display_blue

loop:
  b loop
