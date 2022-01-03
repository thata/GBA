#define IOBASE 0x04000000
#define VIDEO_MODE3 0x0F03
#define VRAM_START 0x06000000
#define LOOP_COUNT (240 * 160)

.arm
.text
  mov r1, #IOBASE
  ldr r2, =VIDEO_MODE3
  strh r2, [r1]

  mov r3, #VRAM_START
  ldr r4, =image_start
  ldr r5, =LOOP_COUNT
display:
  ldrh r2, [r4]
  strh r2, [r3]
  add r3, r3, #2
  add r4, r4, #2
  subs r5, r5, #1
  bne display

loop:
  b loop
