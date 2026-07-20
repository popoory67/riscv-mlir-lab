mod cpu; // The rust file name `cpu.rs`
use cpu::Cpu; // The sturucture name `Cpu` in `cpu.rs`

fn main() {
    let cpu = Cpu::new(1024);

    println!("RISC-V emulator");
    //println!("PC = {}, memory = {} bytes", cpu.pc, cpu.memory.len());
}