module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);


reg [DATA_WIDTH-1:0] F0;
reg [DATA_WIDTH-1:0] F1;

always_ff@(posedge clk)begin
  if(!resetn)begin
    F0 <= 32'h00000001;
    F1 <= 32'h00000001;
  end
  else begin
    F1 <= F0+F1;
    F0 <= F1;
  end
end

assign out = F0;

endmodule