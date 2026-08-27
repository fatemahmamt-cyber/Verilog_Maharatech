//##################################################################################################
/* ITI Verilog Course
   AUTHOR: Fatimah Mohammed Adel,      DATE: 8/24/2026
   Project: ITIBQS
   Module Name : ITIBQS_tb
   Description:
*/
//##################################################################################################
/* ------------------------------------ Module Declarations ------------------------------------- */
module ITIBQS_tb ();
// ----------------------------------- Parameter Declarations ----------------------------------- //
// ------------------------------------- Inputs Declarations ------------------------------------ //
// ------------------------------------ Outputs Declarations ------------------------------------ //
// -------------------------------------- Wire Declarations ------------------------------------- //
wire fullFlag, emptyFlag, fullAlarm, emptyAlarm;
wire [6:0] Pcountdisplay, Wtimetensdisplay, Wtimeunitsdisplay;
// -------------------------------------- Reg Declarations -------------------------------------- //
reg clk, rstn, frontSensor, backSensor, T1, T2, T3;
// ---------------------------------------- Initial setup --------------------------------------- //

initial // Building the clock
begin
    clk = 0;
    forever #50 clk = ~clk; 
end

initial // Defining Cases
begin
// 1. Reset the System (with no body entering or exiting --> empty)
rstn = 0;
frontSensor = 1;
backSensor = 1;
T1 = 1;
T2 = 0;
T3 = 0;
#100;
rstn = 1; 
#100;
// 2. Exiting from empty queue (emptyAlarm should get activated) Testing emptyFlag & emptyAlarm
#100 frontSensor = 0;
#100 frontSensor = 1;
// 3. Entering empty queue till full
#100 backSensor = 0; //1
#100 backSensor = 1;
#100 backSensor = 0; //2
#100 backSensor = 1;
#100 backSensor = 0; //3
#100 backSensor = 1;
#100 backSensor = 0; //4
#100 backSensor = 1;
#100 backSensor = 0; //5
#100 backSensor = 1;
#100 backSensor = 0; //6
#100 backSensor = 1;
#100 backSensor = 0; //7
#100 backSensor = 1;
// Entering into full queue (fullAlarm should get activated) Testing fullFlag & fullAlarm
#100 backSensor = 0; //8
#100 backSensor = 1;

$stop;
end

initial // Displaying Conditions 
begin
$display("---------------------------------------- Test Bench ---------------------------------------");
$display("Time | rstn | frontSensor | backSensor | emptyFlag | fullFlag | emptyAlarm | fullAlarm | PcountDisplay");
$monitor("%4d | %4b | %11b | %10b | %9b | %8b | %10b | %9b | %13b",
         $time, rstn, frontSensor, backSensor, emptyFlag, fullFlag, emptyAlarm, fullAlarm, Pcountdisplay);
end

// ------------------------------------ Instantiation Modules ----------------------------------- //
ITIBQS ITIBQS_DUT (clk, rstn, frontSensor, backSensor, T1, T2, T3, Pcountdisplay, Wtimetensdisplay, Wtimeunitsdisplay, fullFlag, emptyFlag, fullAlarm, emptyAlarm);
// ------------------------------------- Combinational Logic ------------------------------------ //
// --------------------------------------- Sequential Logic ------------------------------------- //
endmodule
// ----------------------------------------- End of File ---------------------------------------- //
