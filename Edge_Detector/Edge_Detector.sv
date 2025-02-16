module model (
  input clk,
  input resetn,
  input din,
  output dout
);

parameter S00=0, S01=1, S10=2;
    logic [1:0] state;

    always @(posedge clk) begin
        if (!resetn) begin
            state <= S00;
        end else begin
            case (state)
                S00 : state <= (din ? S01 : S00);
                S01 : state <= (din ? S10 : S00);
                S10 : state <= (din ? S10 : S00);
            endcase
        end
    end

  assign dout = (state == S01);

endmodule