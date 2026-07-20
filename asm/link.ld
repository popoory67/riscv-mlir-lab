/* A linker script to gather sections in each object and put into one execution file. */
OUTPUT_ARCH(riscv)

/* The entry point is defined in `hello_world.s` */
ENTRY(_start)

/* 
    RAM address range where Spike and the interpreter will use.
    The address starts by 0x80000000, increasing 1 MiB.

    0x80000000
    ├─ .text    : RISC-V instruction
    ├─ .rodata  : constant variable
    ├─ .data    : a variable with an initial value
    ├─ .bss     : a variable without the initial value
    └─ stack    : RAM end, increasing the address from __stack_top to the bottom
    0x80100000
 */
MEMORY
{
    RISCV_RAM(rwx): ORIGIN = 0x80000000, LENGTH = 1M
}

SECTIONS
{
    . = ORIGIN(RISCV_RAM);
    .text : ALIGN(4)
    {
        *(.text.init)
        *(.text .text.*)
    } > RISCV_RAM
    .rodata : ALIGN(4)
    {
        *(.rodata .rodata.*)
    } > RISCV_RAM
    .data : ALIGN(4)
    {
        *(.data .data.*)
        *(.sdata .sdata.*)
    } > RISCV_RAM
    .bss(NOLOAD) : ALIGN(4)
    {
        __bss_start = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        *(COMMON)
        __bss_end = .;
    } > RISCV_RAM

    PROVIDE(__stack_top = ORIGIN(RISCV_RAM) + LENGTH(RISCV_RAM));
}