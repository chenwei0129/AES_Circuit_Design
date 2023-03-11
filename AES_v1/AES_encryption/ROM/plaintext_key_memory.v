`timescale 1ns/100ps
module plaintext_key_memory(pc_i,plaintext_q, key_q);

  input [`ADDR_WIDTH - 1:0] pc_i;
  
  output [`TEXT_WIDTH - 1:0] plaintext_q;
  output [`KEY_WIDTH - 1:0] key_q;
  
  reg [`TEXT_WIDTH - 1:0] plaintext_q;
  reg [`KEY_WIDTH - 1:0] key_q;
  
  reg [`TEXT_WIDTH - 1:0] MEMORY [0:`MEMORY_SIZE - 1];
  reg [`KEY_WIDTH - 1:0] KEY_MEMORY [0:1];
  
  always@(*)begin
    plaintext_q = MEMORY[pc_i];
	key_q = KEY_MEMORY[0];
  end

endmodule