module model (
    input logic clk,
    input logic resetn,
    input logic din,
    input logic cen,
    output logic doutx,
    output logic douty 
);

typedef enum {s0, s1, s2, s3, s4} states;
reg din_ff, cen_ff;
states curr, next;

always_ff @(posedge clk)begin
    if (!resetn)begin
        curr <= s0;
        din_ff <= 0;
        cen_ff <= 0;
    end
    else begin
        curr <= next;
        din_ff <= din;
        cen_ff <= cen;
    end
end

always_comb begin
    case(curr)
    s0 : if (cen_ff & din_ff) begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & din_ff) begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end

    s1 :if (cen_ff & din_ff) begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (cen_ff & !din_ff)begin
            next = s2;
            doutx = 1;
            douty = 0;
        end
        else if (!cen_ff & din_ff) begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & !din_ff)begin
            next = s2;
            doutx = 0;
            douty = 0;
        end

    s2 :if (cen_ff & din_ff) begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (cen_ff & !din_ff)begin
            next = s2;
            doutx = 1;
            douty = 1;
        end
        else if (!cen_ff & din_ff)begin
            next = s3;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & !din_ff)begin
            next = s2;
            doutx = 0;
            douty = 0;
        end
    
    s3 : if (cen_ff & din_ff) begin
            next = s4;
            doutx = 1;
            douty = 0;
        end
        else if (cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & din_ff) begin
            next = s4;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end

    s4 : if (cen_ff & din_ff) begin
            next = s4;
            doutx = 1;
            douty = 1;
        end
        else if (cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & din_ff) begin
            next = s4;
            doutx = 0;
            douty = 0;
        end
        else if (!cen_ff & !din_ff)begin
            next = s1;
            doutx = 0;
            douty = 0;
        end
    
    default : begin 
            next = s0;
            doutx = 0;
            douty = 0;
    end
    endcase
end



endmodule