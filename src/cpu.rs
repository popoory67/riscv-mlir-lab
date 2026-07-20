
pub struct Cpu {
    pc: u32,
    regs: [u32; 32],
    memory: Vec<u8>,
}

impl Cpu {
    pub fn new(memory_size: usize) -> Self {
        Self {
            pc: 0,
            regs: [0; 32],
            memory: vec![0; memory_size],
        }
    }

    pub fn reset(&mut self) {
        self.pc = 0;
        self.regs = [0; 32];
    }

    //fn write_reg()

    fn fetch(&self) -> u32 {
        // Read CPU status
        0
    }

    fn decode(&self, instruction: u32) {
        
    }

    fn execute(&mut self, instruction: u32) {
        // Count and move PC and register
    }
}
