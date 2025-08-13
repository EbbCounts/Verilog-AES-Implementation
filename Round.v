module Round(clk,data_in,key_in,data_out);
    input clk;
    input [127:0]data_in,key_in;
    output [127:0] data_out;

    wire [127:0]sub_data_out,shift_data_out,mix_data_out; 
    
    SubBytes a1(clk,data_in,sub_data_out);
    ShiftRow a2(.clk(clk),
                .data_in(sub_data_out),
                .data_out(shift_data_out)
                );
    MixColumns a3(clk,shift_data_out,mix_data_out);
    assign data_out=mix_data_out^key_in;
endmodule