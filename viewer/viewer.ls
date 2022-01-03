OUTPUT_ARCH(arm)

SECTIONS {
  .text 0x02000000 : { *(.text) }
  .image : {
    image_start = . ;
    *.gba(*)
  }
}
