//##################################################################################################
/* ITI Verilog Course
   AUTHOR: Fatimah Mohammed Adel,      DATE: 8/24/2026
   Project: ITIBQS
   Module Name : controllerFSM
   Description:
*/
//##################################################################################################
/* ------------------------------------ Module Declarations ------------------------------------- */
module controllerFSM (clk, rstn, EDF, EDB, T1, T2, T3, Pcount, Tcount, updown, enable, emptyFlag, fullFlag, emptyAlarm, fullAlarm);
// ----------------------------------- Parameter Declarations ----------------------------------- //
// ------------------------------------- Inputs Declarations ------------------------------------ //
input clk, rstn, EDF, EDB, T1, T2, T3;
input [2:0] Pcount;
// ------------------------------------ Outputs Declarations ------------------------------------ //
output emptyFlag, fullFlag;
output reg  updown, enable, emptyAlarm, fullAlarm;
output [1:0] Tcount;
// -------------------------------------- Wire Declarations ------------------------------------- //
wire [1:0] fb = {EDF, EDB};
// -------------------------------------- Reg Declarations -------------------------------------- //
// ---------------------------------------- Initial setup --------------------------------------- //
// ------------------------------------ Instantiation Modules ----------------------------------- //
// ------------------------------------- Combinational Logic ------------------------------------ //
assign Tcount = {1'b0, T1} + {1'b0, T2} + {1'b0, T3};
assign fullFlag  = (Pcount == 3'b111);
assign emptyFlag = (Pcount == 3'b000);
// --------------------------------------- Sequential Logic ------------------------------------- //
always@(posedge clk or negedge rstn)
begin
    if(~rstn) 
    begin
        updown <= 1;
        enable <= 0;
        fullAlarm <= 0;
        emptyAlarm <= 0;
    end
    else
    begin
        fullAlarm <= 0;
        emptyAlarm <= 0;

        case(fb)
            2'b01:  //one enter
            begin
                if (!fullFlag) 
                begin
                    updown <= 1;
                    enable <= 1;
                end
                else 
                begin
                    fullAlarm <= 1;
                    enable <= 0;
                end
            end

            2'b10:  //one quit
            begin
                if (!emptyFlag) 
                begin
                    updown <= 0;
                    enable <= 1;
                end
                else 
                begin
                    emptyAlarm <= 1;
                    enable <= 0;
                end
            end

            2'b00:  //no one entered
            2'b11:  //one enterd and one quited
            enable <= 0;

        endcase
    end

end
endmodule
// ----------------------------------------- End of File ---------------------------------------- //
