//##################################################################################################
/* ITI Verilog Course
   AUTHOR: Fatimah Mohammed Adel,      DATE: 8/24/2026
   Project: ITIBQS
   Module Name : updownCounter
   Description:
*/
//##################################################################################################
/* ------------------------------------ Module Declarations ------------------------------------- */
module updownCounter 
#(parameter counterWidth = 3)
(clk, rstn, updown, enable, count);
// ----------------------------------- Parameter Declarations ----------------------------------- //
localparam MAXCOUNT = {counterWidth{1'b1}};
localparam MINCOUNT = {counterWidth{1'b0}};
// ------------------------------------- Inputs Declarations ------------------------------------ //
input clk, rstn, updown, enable;
// ------------------------------------ Outputs Declarations ------------------------------------ //
output reg [counterWidth-1:0]count;
// -------------------------------------- Wire Declarations ------------------------------------- //
// -------------------------------------- Reg Declarations -------------------------------------- //
// ---------------------------------------- Initial setup --------------------------------------- //
// ------------------------------------ Instantiation Modules ----------------------------------- //
// ------------------------------------- Combinational Logic ------------------------------------ //
// --------------------------------------- Sequential Logic ------------------------------------- //
always@(posedge clk or negedge rstn)
begin
    if(~rstn) count <= MINCOUNT;
    else
    begin
        if (enable)
        begin
            if (updown) // counts up
            begin
                if (count == MAXCOUNT) count <= count;
                else count <= count + 1'b1;        
            end

            else if (!updown) // counts down 
            begin
                if (count == MINCOUNT) count <= count;
                else  count <= count - 1'b1;
            end          
        end
        else count <= count;
        
    end
    
end
endmodule
// ----------------------------------------- End of File ---------------------------------------- //
