module model (
    input [7:0] din,
    output reg [255:0] dout
);

assign dout = ((1 << din+1)-1);

//assign dout = {256{1'b1}} >> (255-din);

endmodule