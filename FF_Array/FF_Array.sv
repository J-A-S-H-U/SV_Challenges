module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);

reg [7:0] RF [7:0];
reg [7:0]set;

reg error_ff;
reg [7:0]dout_ff;



always_ff @(posedge clk) begin
    if(!resetn)begin
        foreach(RF[i])begin
            RF[i] <= '0;
            set[i]<='0;
        end
        dout_ff <= 0;
        error_ff <= 0;
    end
    else begin
        if (rd && wr)begin
            error_ff <= '1;
            dout_ff <= '0;
        end
        else if (!rd && wr)begin
            error_ff <= '0;
            RF[addr] <= din;
            set[addr] <= '1;
            dout_ff <= '0;
        end
        else if (rd && !wr)begin
            if(set[addr])begin
                error_ff <= '0;
                dout_ff <= RF[addr];
            end
            else begin
                error_ff <= '0;
                dout_ff <= '0;
            end
        end
        else begin
            dout_ff <= 0;
            error_ff <= 0;
        end
        
    end
end
assign error = error_ff;
assign dout = dout_ff;

endmodule