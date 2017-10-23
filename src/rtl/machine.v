module machine( inc_pc, 
                load_acc, 
                load_pc, 
                rd,wr, 
                load_ir,
                datactl_ena, 
                halt, 
                clk1, 
                zero, 
                ena, 
                opcode 
            );

    output inc_pc;
    output load_acc;
    output load_pc;
    output rd;
    output wr; 
    output load_ir;
    output datactl_ena;
    output halt;

    input clk1;
    input zero;
    input ena;
    input [2:0] opcode;

    reg inc_pc;
    reg load_acc;
    reg load_pc;
    reg rd;
    reg wr;
    reg load_ir;
    reg datactl_ena;
    reg halt;
    reg [2:0] state;

    parameter   HLT = 3 'b000,
                SKZ = 3 'b001,
                ADD = 3 'b010,
                ANDD = 3 'b011,
                XORR = 3 'b100,
                LDA = 3 'b101,
                STO = 3 'b110,
                JMP = 3 'b111;

    always @( negedge clk1 ) begin
        if ( !ena ) begin
            state<=3'b000;
            {inc_pc,load_acc,load_pc,rd}<=4'b0000;
            {wr,load_ir,datactl_ena,halt}<=4'b0000;
        end
        else
            ctl_cycle;
    end

    //-----------------begin of task ctl_cycle---------
    task ctl_cycle;
    begin
    casex(state)
        3'b000: //load high 8bits in struction
        begin
            {inc_pc,load_acc,load_pc,rd}<=4'b0001;
            {wr,load_ir,datactl_ena,halt}<=4'b0100;
            state<=3'b001;
        end
        3'b001: //pc increased by one then load low 8bits instruction
        begin
            {inc_pc,load_acc,load_pc,rd}<=4'b1001;
            {wr,load_ir,datactl_ena,halt}<=4'b0100;
            state<=3'b010;
        end
        3'b010: //idle
        begin
            {inc_pc,load_acc,load_pc,rd}<=4'b0000;
            {wr,load_ir,datactl_ena,halt}<=4'b0000;
            state<=3'b011;
        end
        3'b011: //next instruction address setup 
        begin
            if(opcode==HLT) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b1000;
                {wr,load_ir,datactl_ena,halt}<=4'b0001;
            end
            else begin
                {inc_pc,load_acc,load_pc,rd}<=4'b1000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            state<=3'b100;
        end
        3'b100: //fetch oprand
        begin
            if(opcode==JMP) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0010;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else if( opcode==ADD || opcode==ANDD || opcode==XORR || opcode==LDA) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0001;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else if(opcode==STO) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0010;
            end
            else begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            state<=3'b101;
        end
        3'b101: //operation
        begin
            if ( opcode==ADD||opcode==ANDD|| opcode==XORR||opcode==LDA ) begin 
                {inc_pc,load_acc,load_pc,rd}<=4'b0101;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else if( opcode==SKZ && zero==1) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b1000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else if(opcode==JMP) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b1010;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else if(opcode==STO) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b1010;
            end
            else begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            state<=3'b110;
        end
        3'b110: //idle
        begin
            if ( opcode==STO ) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0010;
            end
            else if ( opcode==ADD||opcode==ANDD|| opcode==XORR||opcode==LDA) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0001;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            state<=3'b111;
        end
        3'b111: 
        begin
            if( opcode==SKZ && zero==1 ) begin
                {inc_pc,load_acc,load_pc,rd}<=4'b1000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            else begin
                {inc_pc,load_acc,load_pc,rd}<=4'b0000;
                {wr,load_ir,datactl_ena,halt}<=4'b0000;
            end
            state<=3'b000;
        end
        default:
        begin
            {inc_pc,load_acc,load_pc,rd}<=4'b0000;
            {wr,load_ir,datactl_ena,halt}<=4'b0000;
            state<=3'b000;
        end
    endcase
    end
    endtask
//-----------------end of task ctl_cycle---------
endmodule
