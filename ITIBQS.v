//##################################################################################################
/* ITI Verilog Course
   AUTHOR: Fatimah Mohammed Adel,      DATE: 8/25/2026
   Project: ITIBQS
   Module Name : ITIBQS
   Description:
*/
//##################################################################################################
/* ------------------------------------ Module Declarations ------------------------------------- */
module ITIBQS (clk, rstn, frontSensor, backSensor, T1, T2, T3, Pcountdisplay, Wtimetensdisplay, Wtimeunitsdisplay, fullFlag, emptyFlag, fullAlarm, emptyAlarm);
// ----------------------------------- Parameter Declarations ----------------------------------- //
// ------------------------------------- Inputs Declarations ------------------------------------ //
input clk, rstn, frontSensor, backSensor, T1, T2, T3;
// ------------------------------------ Outputs Declarations ------------------------------------ //
output fullFlag, emptyFlag, fullAlarm, emptyAlarm;
output [6:0] Pcountdisplay, Wtimetensdisplay, Wtimeunitsdisplay;
// -------------------------------------- Wire Declarations ------------------------------------- //
wire [4:0] addr = {Tcount, Pcount};
wire [3:0] Pcount7segin = {1'b0, Pcount};
wire [7:0] Wtime;
wire [3:0] Wtimetens = Wtime[7:4];
wire [3:0] Wtimeunits = Wtime[3:0];
wire EDB, EDF, updown, enable;
wire [1:0] Tcount;
wire [2:0] Pcount;

// -------------------------------------- Reg Declarations -------------------------------------- //
// ---------------------------------------- Initial setup --------------------------------------- //
// ------------------------------------ Instantiation Modules ----------------------------------- //
edgeDetector frontEdgeDetector(clk, frontSensor, EDF);
edgeDetector backEdgeDetector(clk, backSensor, EDB);
controllerFSM controller(clk, rstn, EDF, EDB, T1, T2, T3, Pcount, Tcount, updown, enable, emptyFlag, fullFlag, emptyAlarm, fullAlarm);
updownCounter #(3) PcountCounter(clk, rstn, updown, enable, Pcount);
WtimeROM WtimeROM(addr, Wtime);
sevenSeg Pcount7seg(Pcount7segin, Pcountdisplay);
sevenSeg Wtime7segtens(Wtimetens, Wtimetensdisplay);
sevenSeg Wtime7segunits(Wtimeunits, Wtimeunitsdisplay);
// ------------------------------------- Combinational Logic ------------------------------------ //
// --------------------------------------- Sequential Logic ------------------------------------- //
endmodule
// ----------------------------------------- End of File ---------------------------------------- //
