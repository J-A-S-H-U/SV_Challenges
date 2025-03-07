module stop_watch #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

    logic state;
    logic [DATA_WIDTH-1:0] temp;

    always @(posedge clk) begin
        if (reset) begin
            temp <= 0;
            state <= 0;
        end else if (stop) begin
            state <= 0;
        end else if (start || state) begin
            state <= 1;
            temp <= (temp == MAX) ? 0 : temp + 1;
        end
    end

    assign count = temp;

endmodule