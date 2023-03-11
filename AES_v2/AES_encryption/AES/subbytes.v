`timescale 1ns/100ps
module subbytes(clk_i, rst_ni, cyphertext_temp_i, cyphertext_temp_o);

  input clk_i;
  input rst_ni;
  input [`TEXT_WIDTH - 1:0] cyphertext_temp_i;
  
  output [`TEXT_WIDTH - 1:0] cyphertext_temp_o;
  
  reg [`TEXT_WIDTH - 1:0] cyphertext_temp_o;
  reg [`BYTE_WIDTH - 1:0] S_box [0:`S_box_size - 1];
  
  always@(posedge clk_i or negedge rst_ni)begin
    if(~rst_ni)begin
	  S_box[0] <= `BYTE_WIDTH'h63;
	  S_box[1] <= `BYTE_WIDTH'h7c;
	  S_box[2] <= `BYTE_WIDTH'h77;
	  S_box[3] <= `BYTE_WIDTH'h7b;
	  S_box[4] <= `BYTE_WIDTH'hf2;
	  S_box[5] <= `BYTE_WIDTH'h6b;
	  S_box[6] <= `BYTE_WIDTH'h6f;
	  S_box[7] <= `BYTE_WIDTH'hc5;
	  S_box[8] <= `BYTE_WIDTH'h30;
	  S_box[9] <= `BYTE_WIDTH'h01;
	  S_box[10] <= `BYTE_WIDTH'h67;
	  S_box[11] <= `BYTE_WIDTH'h2b;
	  S_box[12] <= `BYTE_WIDTH'hfe;
	  S_box[13] <= `BYTE_WIDTH'hd7;
	  S_box[14] <= `BYTE_WIDTH'hab;
	  S_box[15] <= `BYTE_WIDTH'h76;
	  S_box[16] <= `BYTE_WIDTH'hca;
	  S_box[17] <= `BYTE_WIDTH'h82;
	  S_box[18] <= `BYTE_WIDTH'hc9;
	  S_box[19] <= `BYTE_WIDTH'h7d;
	  S_box[20] <= `BYTE_WIDTH'hfa;
	  S_box[21] <= `BYTE_WIDTH'h59;
	  S_box[22] <= `BYTE_WIDTH'h47;
	  S_box[23] <= `BYTE_WIDTH'hf0;
	  S_box[24] <= `BYTE_WIDTH'had;
	  S_box[25] <= `BYTE_WIDTH'hd4;
	  S_box[26] <= `BYTE_WIDTH'ha2;
	  S_box[27] <= `BYTE_WIDTH'haf;
	  S_box[28] <= `BYTE_WIDTH'h9c;
	  S_box[29] <= `BYTE_WIDTH'ha4;
	  S_box[30] <= `BYTE_WIDTH'h72;
	  S_box[31] <= `BYTE_WIDTH'hc0;
	  S_box[32] <= `BYTE_WIDTH'hb7;
	  S_box[33] <= `BYTE_WIDTH'hfd;
	  S_box[34] <= `BYTE_WIDTH'h93;
	  S_box[35] <= `BYTE_WIDTH'h26;
	  S_box[36] <= `BYTE_WIDTH'h36;
	  S_box[37] <= `BYTE_WIDTH'h3f;
	  S_box[38] <= `BYTE_WIDTH'hf7;
	  S_box[39] <= `BYTE_WIDTH'hcc;
	  S_box[40] <= `BYTE_WIDTH'h34;
	  S_box[41] <= `BYTE_WIDTH'ha5;
	  S_box[42] <= `BYTE_WIDTH'he5;
	  S_box[43] <= `BYTE_WIDTH'hf1;
	  S_box[44] <= `BYTE_WIDTH'h71;
	  S_box[45] <= `BYTE_WIDTH'hd8;
	  S_box[46] <= `BYTE_WIDTH'h31;
	  S_box[47] <= `BYTE_WIDTH'h15;
	  S_box[48] <= `BYTE_WIDTH'h04;
	  S_box[49] <= `BYTE_WIDTH'hc7;
	  S_box[50] <= `BYTE_WIDTH'h23;
	  S_box[51] <= `BYTE_WIDTH'hc3;
	  S_box[52] <= `BYTE_WIDTH'h18;
	  S_box[53] <= `BYTE_WIDTH'h96;
	  S_box[54] <= `BYTE_WIDTH'h05;
	  S_box[55] <= `BYTE_WIDTH'h9a;
	  S_box[56] <= `BYTE_WIDTH'h07;
	  S_box[57] <= `BYTE_WIDTH'h12;
	  S_box[58] <= `BYTE_WIDTH'h80;
	  S_box[59] <= `BYTE_WIDTH'he2;
	  S_box[60] <= `BYTE_WIDTH'heb;
	  S_box[61] <= `BYTE_WIDTH'h27;
	  S_box[62] <= `BYTE_WIDTH'hb2;
	  S_box[63] <= `BYTE_WIDTH'h75;
	  S_box[64] <= `BYTE_WIDTH'h09;
	  S_box[65] <= `BYTE_WIDTH'h83;
	  S_box[66] <= `BYTE_WIDTH'h2c;
	  S_box[67] <= `BYTE_WIDTH'h1a;
	  S_box[68] <= `BYTE_WIDTH'h1b;
	  S_box[69] <= `BYTE_WIDTH'h6e;
	  S_box[70] <= `BYTE_WIDTH'h5a;
	  S_box[71] <= `BYTE_WIDTH'ha0;
	  S_box[72] <= `BYTE_WIDTH'h52;
	  S_box[73] <= `BYTE_WIDTH'h3b;
	  S_box[74] <= `BYTE_WIDTH'hd6;
	  S_box[75] <= `BYTE_WIDTH'hb3;
	  S_box[76] <= `BYTE_WIDTH'h29;
	  S_box[77] <= `BYTE_WIDTH'he3;
	  S_box[78] <= `BYTE_WIDTH'h2f;
	  S_box[79] <= `BYTE_WIDTH'h84;
	  S_box[80] <= `BYTE_WIDTH'h53;
	  S_box[81] <= `BYTE_WIDTH'hd1;
	  S_box[82] <= `BYTE_WIDTH'h00;
	  S_box[83] <= `BYTE_WIDTH'hed;
	  S_box[84] <= `BYTE_WIDTH'h20;
	  S_box[85] <= `BYTE_WIDTH'hfc;
	  S_box[86] <= `BYTE_WIDTH'hb1;
	  S_box[87] <= `BYTE_WIDTH'h5b;
	  S_box[88] <= `BYTE_WIDTH'h6a;
	  S_box[89] <= `BYTE_WIDTH'hcb;
	  S_box[90] <= `BYTE_WIDTH'hbe;
	  S_box[91] <= `BYTE_WIDTH'h39;
	  S_box[92] <= `BYTE_WIDTH'h4a;
	  S_box[93] <= `BYTE_WIDTH'h4c;
	  S_box[94] <= `BYTE_WIDTH'h58;
	  S_box[95] <= `BYTE_WIDTH'hcf;
	  S_box[96] <= `BYTE_WIDTH'hd0;
	  S_box[97] <= `BYTE_WIDTH'hef;
	  S_box[98] <= `BYTE_WIDTH'haa;
	  S_box[99] <= `BYTE_WIDTH'hfb;
	  S_box[100] <= `BYTE_WIDTH'h43;
	  S_box[101] <= `BYTE_WIDTH'h4d;
	  S_box[102] <= `BYTE_WIDTH'h33;
	  S_box[103] <= `BYTE_WIDTH'h85;
	  S_box[104] <= `BYTE_WIDTH'h45;
	  S_box[105] <= `BYTE_WIDTH'hf9;
	  S_box[106] <= `BYTE_WIDTH'h02;
	  S_box[107] <= `BYTE_WIDTH'h7f;
	  S_box[108] <= `BYTE_WIDTH'h50;
	  S_box[109] <= `BYTE_WIDTH'h3c;
	  S_box[110] <= `BYTE_WIDTH'h9f;
	  S_box[111] <= `BYTE_WIDTH'ha8;
	  S_box[112] <= `BYTE_WIDTH'h51;
	  S_box[113] <= `BYTE_WIDTH'ha3;
	  S_box[114] <= `BYTE_WIDTH'h40;
	  S_box[115] <= `BYTE_WIDTH'h8f;
	  S_box[116] <= `BYTE_WIDTH'h92;
	  S_box[117] <= `BYTE_WIDTH'h9d;
	  S_box[118] <= `BYTE_WIDTH'h38;
	  S_box[119] <= `BYTE_WIDTH'hf5;
	  S_box[120] <= `BYTE_WIDTH'hbc;
	  S_box[121] <= `BYTE_WIDTH'hb6;
	  S_box[122] <= `BYTE_WIDTH'hda;
	  S_box[123] <= `BYTE_WIDTH'h21;
	  S_box[124] <= `BYTE_WIDTH'h10;
	  S_box[125] <= `BYTE_WIDTH'hff;
	  S_box[126] <= `BYTE_WIDTH'hf3;
	  S_box[127] <= `BYTE_WIDTH'hd2;
	  S_box[128] <= `BYTE_WIDTH'hcd;
	  S_box[129] <= `BYTE_WIDTH'h0c;
	  S_box[130] <= `BYTE_WIDTH'h13;
	  S_box[131] <= `BYTE_WIDTH'hec;
	  S_box[132] <= `BYTE_WIDTH'h5f;
	  S_box[133] <= `BYTE_WIDTH'h97;
	  S_box[134] <= `BYTE_WIDTH'h44;
	  S_box[135] <= `BYTE_WIDTH'h17;
	  S_box[136] <= `BYTE_WIDTH'hc4;
	  S_box[137] <= `BYTE_WIDTH'ha7;
	  S_box[138] <= `BYTE_WIDTH'h7e;
	  S_box[139] <= `BYTE_WIDTH'h3d;
	  S_box[140] <= `BYTE_WIDTH'h64;
	  S_box[141] <= `BYTE_WIDTH'h5d;
	  S_box[142] <= `BYTE_WIDTH'h19;
	  S_box[143] <= `BYTE_WIDTH'h73;
	  S_box[144] <= `BYTE_WIDTH'h60;
	  S_box[145] <= `BYTE_WIDTH'h81;
	  S_box[146] <= `BYTE_WIDTH'h4f;
	  S_box[147] <= `BYTE_WIDTH'hdc;
	  S_box[148] <= `BYTE_WIDTH'h22;
	  S_box[149] <= `BYTE_WIDTH'h2a;
	  S_box[150] <= `BYTE_WIDTH'h90;
	  S_box[151] <= `BYTE_WIDTH'h88;
	  S_box[152] <= `BYTE_WIDTH'h46;
	  S_box[153] <= `BYTE_WIDTH'hee;
	  S_box[154] <= `BYTE_WIDTH'hb8;
	  S_box[155] <= `BYTE_WIDTH'h14;
	  S_box[156] <= `BYTE_WIDTH'hde;
	  S_box[157] <= `BYTE_WIDTH'h5e;
	  S_box[158] <= `BYTE_WIDTH'h0b;
	  S_box[159] <= `BYTE_WIDTH'hdb;
	  S_box[160] <= `BYTE_WIDTH'he0;
	  S_box[161] <= `BYTE_WIDTH'h32;
	  S_box[162] <= `BYTE_WIDTH'h3a;
	  S_box[163] <= `BYTE_WIDTH'h0a;
	  S_box[164] <= `BYTE_WIDTH'h49;
	  S_box[165] <= `BYTE_WIDTH'h06;
	  S_box[166] <= `BYTE_WIDTH'h24;
	  S_box[167] <= `BYTE_WIDTH'h5c;
	  S_box[168] <= `BYTE_WIDTH'hc2;
	  S_box[169] <= `BYTE_WIDTH'hd3;
	  S_box[170] <= `BYTE_WIDTH'hac;
	  S_box[171] <= `BYTE_WIDTH'h62;
	  S_box[172] <= `BYTE_WIDTH'h91;
	  S_box[173] <= `BYTE_WIDTH'h95;
	  S_box[174] <= `BYTE_WIDTH'he4;
	  S_box[175] <= `BYTE_WIDTH'h79;
	  S_box[176] <= `BYTE_WIDTH'he7;
	  S_box[177] <= `BYTE_WIDTH'hc8;
	  S_box[178] <= `BYTE_WIDTH'h37;
	  S_box[179] <= `BYTE_WIDTH'h6d;
	  S_box[180] <= `BYTE_WIDTH'h8d;
	  S_box[181] <= `BYTE_WIDTH'hd5;
	  S_box[182] <= `BYTE_WIDTH'h4e;
	  S_box[183] <= `BYTE_WIDTH'ha9;
	  S_box[184] <= `BYTE_WIDTH'h6c;
	  S_box[185] <= `BYTE_WIDTH'h56;
	  S_box[186] <= `BYTE_WIDTH'hf4;
	  S_box[187] <= `BYTE_WIDTH'hea;
	  S_box[188] <= `BYTE_WIDTH'h65;
	  S_box[189] <= `BYTE_WIDTH'h7a;
	  S_box[190] <= `BYTE_WIDTH'hae;
	  S_box[191] <= `BYTE_WIDTH'h08;
	  S_box[192] <= `BYTE_WIDTH'hba;
	  S_box[193] <= `BYTE_WIDTH'h78;
	  S_box[194] <= `BYTE_WIDTH'h25;
	  S_box[195] <= `BYTE_WIDTH'h2e;
	  S_box[196] <= `BYTE_WIDTH'h1c;
	  S_box[197] <= `BYTE_WIDTH'ha6;
	  S_box[198] <= `BYTE_WIDTH'hb4;
	  S_box[199] <= `BYTE_WIDTH'hc6;
	  S_box[200] <= `BYTE_WIDTH'he8;
	  S_box[201] <= `BYTE_WIDTH'hdd;
	  S_box[202] <= `BYTE_WIDTH'h74;
	  S_box[203] <= `BYTE_WIDTH'h1f;
	  S_box[204] <= `BYTE_WIDTH'h4b;
	  S_box[205] <= `BYTE_WIDTH'hbd;
	  S_box[206] <= `BYTE_WIDTH'h8b;
	  S_box[207] <= `BYTE_WIDTH'h8a;
	  S_box[208] <= `BYTE_WIDTH'h70;
	  S_box[209] <= `BYTE_WIDTH'h3e;
	  S_box[210] <= `BYTE_WIDTH'hb5;
	  S_box[211] <= `BYTE_WIDTH'h66;
	  S_box[212] <= `BYTE_WIDTH'h48;
	  S_box[213] <= `BYTE_WIDTH'h03;
	  S_box[214] <= `BYTE_WIDTH'hf6;
	  S_box[215] <= `BYTE_WIDTH'h0e;
	  S_box[216] <= `BYTE_WIDTH'h61;
	  S_box[217] <= `BYTE_WIDTH'h35;
	  S_box[218] <= `BYTE_WIDTH'h57;
	  S_box[219] <= `BYTE_WIDTH'hb9;
	  S_box[220] <= `BYTE_WIDTH'h86;
	  S_box[221] <= `BYTE_WIDTH'hc1;
	  S_box[222] <= `BYTE_WIDTH'h1d;
	  S_box[223] <= `BYTE_WIDTH'h9e;
	  S_box[224] <= `BYTE_WIDTH'he1;
	  S_box[225] <= `BYTE_WIDTH'hf8;
	  S_box[226] <= `BYTE_WIDTH'h98;
	  S_box[227] <= `BYTE_WIDTH'h11;
	  S_box[228] <= `BYTE_WIDTH'h69;
	  S_box[229] <= `BYTE_WIDTH'hd9;
	  S_box[230] <= `BYTE_WIDTH'h8e;
	  S_box[231] <= `BYTE_WIDTH'h94;
	  S_box[232] <= `BYTE_WIDTH'h9b;
	  S_box[233] <= `BYTE_WIDTH'h1e;
	  S_box[234] <= `BYTE_WIDTH'h87;
	  S_box[235] <= `BYTE_WIDTH'he9;
	  S_box[236] <= `BYTE_WIDTH'hce;
	  S_box[237] <= `BYTE_WIDTH'h55;
	  S_box[238] <= `BYTE_WIDTH'h28;
	  S_box[239] <= `BYTE_WIDTH'hdf;
	  S_box[240] <= `BYTE_WIDTH'h8c;
	  S_box[241] <= `BYTE_WIDTH'ha1;
	  S_box[242] <= `BYTE_WIDTH'h89;
	  S_box[243] <= `BYTE_WIDTH'h0d;
	  S_box[244] <= `BYTE_WIDTH'hbf;
	  S_box[245] <= `BYTE_WIDTH'he6;
	  S_box[246] <= `BYTE_WIDTH'h42;
	  S_box[247] <= `BYTE_WIDTH'h68;
	  S_box[248] <= `BYTE_WIDTH'h41;
	  S_box[249] <= `BYTE_WIDTH'h99;
	  S_box[250] <= `BYTE_WIDTH'h2d;
	  S_box[251] <= `BYTE_WIDTH'h0f;
	  S_box[252] <= `BYTE_WIDTH'hb0;
	  S_box[253] <= `BYTE_WIDTH'h54;
	  S_box[254] <= `BYTE_WIDTH'hbb;
	  S_box[255] <= `BYTE_WIDTH'h16;
	end
	else begin
	  S_box[0] <= S_box[0];
	  S_box[1] <= S_box[1];
	  S_box[2] <= S_box[2];
	  S_box[3] <= S_box[3];
	  S_box[4] <= S_box[4];
	  S_box[5] <= S_box[5];
	  S_box[6] <= S_box[6];
	  S_box[7] <= S_box[7];
	  S_box[8] <= S_box[8];
	  S_box[9] <= S_box[9];
	  S_box[10] <= S_box[10];
	  S_box[11] <= S_box[11];
	  S_box[12] <= S_box[12];
	  S_box[13] <= S_box[13];
	  S_box[14] <= S_box[14];
	  S_box[15] <= S_box[15];
	  S_box[16] <= S_box[16];
	  S_box[17] <= S_box[17];
	  S_box[18] <= S_box[18];
	  S_box[19] <= S_box[19];
	  S_box[20] <= S_box[20];
	  S_box[21] <= S_box[21];
	  S_box[22] <= S_box[22];
	  S_box[23] <= S_box[23];
	  S_box[24] <= S_box[24];
	  S_box[25] <= S_box[25];
	  S_box[26] <= S_box[26];
	  S_box[27] <= S_box[27];
	  S_box[28] <= S_box[28];
	  S_box[29] <= S_box[29];
	  S_box[30] <= S_box[30];
	  S_box[31] <= S_box[31];
	  S_box[32] <= S_box[32];
	  S_box[33] <= S_box[33];
	  S_box[34] <= S_box[34];
	  S_box[35] <= S_box[35];
	  S_box[36] <= S_box[36];
	  S_box[37] <= S_box[37];
	  S_box[38] <= S_box[38];
	  S_box[39] <= S_box[39];
	  S_box[40] <= S_box[40];
	  S_box[41] <= S_box[41];
	  S_box[42] <= S_box[42];
	  S_box[43] <= S_box[43];
	  S_box[44] <= S_box[44];
	  S_box[45] <= S_box[45];
	  S_box[46] <= S_box[46];
	  S_box[47] <= S_box[47];
	  S_box[48] <= S_box[48];
	  S_box[49] <= S_box[49];
	  S_box[50] <= S_box[50];
	  S_box[51] <= S_box[51];
	  S_box[52] <= S_box[52];
	  S_box[53] <= S_box[53];
	  S_box[54] <= S_box[54];
	  S_box[55] <= S_box[55];
	  S_box[56] <= S_box[56];
	  S_box[57] <= S_box[57];
	  S_box[58] <= S_box[58];
	  S_box[59] <= S_box[59];
	  S_box[60] <= S_box[60];
	  S_box[61] <= S_box[61];
	  S_box[62] <= S_box[62];
	  S_box[63] <= S_box[63];
	  S_box[64] <= S_box[64];
	  S_box[65] <= S_box[65];
	  S_box[66] <= S_box[66];
	  S_box[67] <= S_box[67];
	  S_box[68] <= S_box[68];
	  S_box[69] <= S_box[69];
	  S_box[70] <= S_box[70];
	  S_box[71] <= S_box[71];
	  S_box[72] <= S_box[72];
	  S_box[73] <= S_box[73];
	  S_box[74] <= S_box[74];
	  S_box[75] <= S_box[75];
	  S_box[76] <= S_box[76];
	  S_box[77] <= S_box[77];
	  S_box[78] <= S_box[78];
	  S_box[79] <= S_box[79];
	  S_box[80] <= S_box[80];
	  S_box[81] <= S_box[81];
	  S_box[82] <= S_box[82];
	  S_box[83] <= S_box[83];
	  S_box[84] <= S_box[84];
	  S_box[85] <= S_box[85];
	  S_box[86] <= S_box[86];
	  S_box[87] <= S_box[87];
	  S_box[88] <= S_box[88];
	  S_box[89] <= S_box[89];
	  S_box[90] <= S_box[90];
	  S_box[91] <= S_box[91];
	  S_box[92] <= S_box[92];
	  S_box[93] <= S_box[93];
	  S_box[94] <= S_box[94];
	  S_box[95] <= S_box[95];
	  S_box[96] <= S_box[96];
	  S_box[97] <= S_box[97];
	  S_box[98] <= S_box[98];
	  S_box[99] <= S_box[99];
	  S_box[100] <= S_box[100];
	  S_box[101] <= S_box[101];
	  S_box[102] <= S_box[102];
	  S_box[103] <= S_box[103];
	  S_box[104] <= S_box[104];
	  S_box[105] <= S_box[105];
	  S_box[106] <= S_box[106];
	  S_box[107] <= S_box[107];
	  S_box[108] <= S_box[108];
	  S_box[109] <= S_box[109];
	  S_box[110] <= S_box[110];
	  S_box[111] <= S_box[111];
	  S_box[112] <= S_box[112];
	  S_box[113] <= S_box[113];
	  S_box[114] <= S_box[114];
	  S_box[115] <= S_box[115];
	  S_box[116] <= S_box[116];
	  S_box[117] <= S_box[117];
	  S_box[118] <= S_box[118];
	  S_box[119] <= S_box[119];
	  S_box[120] <= S_box[120];
	  S_box[121] <= S_box[121];
	  S_box[122] <= S_box[122];
	  S_box[123] <= S_box[123];
	  S_box[124] <= S_box[124];
	  S_box[125] <= S_box[125];
	  S_box[126] <= S_box[126];
	  S_box[127] <= S_box[127];
	  S_box[128] <= S_box[128];
	  S_box[129] <= S_box[129];
	  S_box[130] <= S_box[130];
	  S_box[131] <= S_box[131];
	  S_box[132] <= S_box[132];
	  S_box[133] <= S_box[133];
	  S_box[134] <= S_box[134];
	  S_box[135] <= S_box[135];
	  S_box[136] <= S_box[136];
	  S_box[137] <= S_box[137];
	  S_box[138] <= S_box[138];
	  S_box[139] <= S_box[139];
	  S_box[140] <= S_box[140];
	  S_box[141] <= S_box[141];
	  S_box[142] <= S_box[142];
	  S_box[143] <= S_box[143];
	  S_box[144] <= S_box[144];
	  S_box[145] <= S_box[145];
	  S_box[146] <= S_box[146];
	  S_box[147] <= S_box[147];
	  S_box[148] <= S_box[148];
	  S_box[149] <= S_box[149];
	  S_box[150] <= S_box[150];
	  S_box[151] <= S_box[151];
	  S_box[152] <= S_box[152];
	  S_box[153] <= S_box[153];
	  S_box[154] <= S_box[154];
	  S_box[155] <= S_box[155];
	  S_box[156] <= S_box[156];
	  S_box[157] <= S_box[157];
	  S_box[158] <= S_box[158];
	  S_box[159] <= S_box[159];
	  S_box[160] <= S_box[160];
	  S_box[161] <= S_box[161];
	  S_box[162] <= S_box[162];
	  S_box[163] <= S_box[163];
	  S_box[164] <= S_box[164];
	  S_box[165] <= S_box[165];
	  S_box[166] <= S_box[166];
	  S_box[167] <= S_box[167];
	  S_box[168] <= S_box[168];
	  S_box[169] <= S_box[169];
	  S_box[170] <= S_box[170];
	  S_box[171] <= S_box[171];
	  S_box[172] <= S_box[172];
	  S_box[173] <= S_box[173];
	  S_box[174] <= S_box[174];
	  S_box[175] <= S_box[175];
	  S_box[176] <= S_box[176];
	  S_box[177] <= S_box[177];
	  S_box[178] <= S_box[178];
	  S_box[179] <= S_box[179];
	  S_box[180] <= S_box[180];
	  S_box[181] <= S_box[181];
	  S_box[182] <= S_box[182];
	  S_box[183] <= S_box[183];
	  S_box[184] <= S_box[184];
	  S_box[185] <= S_box[185];
	  S_box[186] <= S_box[186];
	  S_box[187] <= S_box[187];
	  S_box[188] <= S_box[188];
	  S_box[189] <= S_box[189];
	  S_box[190] <= S_box[190];
	  S_box[191] <= S_box[191];
	  S_box[192] <= S_box[192];
	  S_box[193] <= S_box[193];
	  S_box[194] <= S_box[194];
	  S_box[195] <= S_box[195];
	  S_box[196] <= S_box[196];
	  S_box[197] <= S_box[197];
	  S_box[198] <= S_box[198];
	  S_box[199] <= S_box[199];
	  S_box[200] <= S_box[200];
	  S_box[201] <= S_box[201];
	  S_box[202] <= S_box[202];
	  S_box[203] <= S_box[203];
	  S_box[204] <= S_box[204];
	  S_box[205] <= S_box[205];
	  S_box[206] <= S_box[206];
	  S_box[207] <= S_box[207];
	  S_box[208] <= S_box[208];
	  S_box[209] <= S_box[209];
	  S_box[210] <= S_box[210];
	  S_box[211] <= S_box[211];
	  S_box[212] <= S_box[212];
	  S_box[213] <= S_box[213];
	  S_box[214] <= S_box[214];
	  S_box[215] <= S_box[215];
	  S_box[216] <= S_box[216];
	  S_box[217] <= S_box[217];
	  S_box[218] <= S_box[218];
	  S_box[219] <= S_box[219];
	  S_box[220] <= S_box[220];
	  S_box[221] <= S_box[221];
	  S_box[222] <= S_box[222];
	  S_box[223] <= S_box[223];
	  S_box[224] <= S_box[224];
	  S_box[225] <= S_box[225];
	  S_box[226] <= S_box[226];
	  S_box[227] <= S_box[227];
	  S_box[228] <= S_box[228];
	  S_box[229] <= S_box[229];
	  S_box[230] <= S_box[230];
	  S_box[231] <= S_box[231];
	  S_box[232] <= S_box[232];
	  S_box[233] <= S_box[233];
	  S_box[234] <= S_box[234];
	  S_box[235] <= S_box[235];
	  S_box[236] <= S_box[236];
	  S_box[237] <= S_box[237];
	  S_box[238] <= S_box[238];
	  S_box[239] <= S_box[239];
	  S_box[240] <= S_box[240];
	  S_box[241] <= S_box[241];
	  S_box[242] <= S_box[242];
	  S_box[243] <= S_box[243];
	  S_box[244] <= S_box[244];
	  S_box[245] <= S_box[245];
	  S_box[246] <= S_box[246];
	  S_box[247] <= S_box[247];
	  S_box[248] <= S_box[248];
	  S_box[249] <= S_box[249];
	  S_box[250] <= S_box[250];
	  S_box[251] <= S_box[251];
	  S_box[252] <= S_box[252];
	  S_box[253] <= S_box[253];
	  S_box[254] <= S_box[254];
	  S_box[255] <= S_box[255];
	end
  end
  
  always@(*)begin
    cyphertext_temp_o = {S_box[cyphertext_temp_i[127:120]],
                         S_box[cyphertext_temp_i[119:112]],
						 S_box[cyphertext_temp_i[111:104]],
						 S_box[cyphertext_temp_i[103:96]],
						 S_box[cyphertext_temp_i[95:88]],
						 S_box[cyphertext_temp_i[87:80]],
						 S_box[cyphertext_temp_i[79:72]],
						 S_box[cyphertext_temp_i[71:64]],
						 S_box[cyphertext_temp_i[63:56]],
						 S_box[cyphertext_temp_i[55:48]],
						 S_box[cyphertext_temp_i[47:40]],
						 S_box[cyphertext_temp_i[39:32]],
						 S_box[cyphertext_temp_i[31:24]],
						 S_box[cyphertext_temp_i[23:16]],
						 S_box[cyphertext_temp_i[15:8]],
						 S_box[cyphertext_temp_i[7:0]]};
  end
  
endmodule
