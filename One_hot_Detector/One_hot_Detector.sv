module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);

    int i;
    logic [DATA_WIDTH-1:0] num_ones;

    always_comb begin
        num_ones = 0;
        foreach (din[i]) begin
            if(din[i])begin
              num_ones += din[i];
            end
            
        end
    end

    assign onehot = (num_ones == 1);

endmodule