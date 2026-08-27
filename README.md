# 📌 Project Overview
ITIBQS is a Verilog-based digital controller designed for a Bank Queueing System. The system automatically tracks customer entry and exit using hardware sensors, manages customer count, calculates estimated wait times using a ROM lookup table, and displays system status via 7-segment displays and alarm flags.

- **Author:** Fatimah Mohammed Adel
- **Course:** ITI Verilog Digital Design Course
- **Date:** August 2026




## 🛠️ Features & Functionality

- **Active-Low Sensor Processing:** 
  Built-in edge detection converts active-low sensor signals (`frontSensor` for exit, `backSensor` for entry) into single-clock-cycle pulses.

- **FSM Controller:** 
  Manages queue states, tracks occupancy limits, and triggers alarms.

- **Up/Down Counter:** 
  Real-time tracking of people count (`Pcount`).

- **Wait-Time ROM (`WtimeROM`):** 
  Decodes occupancy and service transaction parameters (`Tcount`) to provide estimated wait times.

- **7-Segment Display Drivers:** 
  Decodes counts and wait times into active-high 7-segment outputs for physical hardware displays.

- **Status Flags & Alarms:** 
  Active indicators for `emptyFlag`, `fullFlag`, `emptyAlarm`, and `fullAlarm`.


## 🏗️ System Architecture & Module Hierarchy
```text
ITIBQS (Top-Level)
 ├── edgeDetector (frontEdgeDetector)
 │    └── dflipflop
 ├── edgeDetector (backEdgeDetector)
 │    └── dflipflop
 ├── controllerFSM
 ├── updownCounter
 ├── WtimeROM
 ├── sevenSeg (Pcount7seg)
 ├── sevenSeg (Wtime7segtens)
 └── sevenSeg (Wtime7segunits)
```
## 🔌 Top-Level Interface (Inputs / Outputs) 

| **Port**           | **Description**                                                                                           | **Type**    | **Possible Values**               |
|----------------|-------------------------------------------------------------------------------------------------------|---------|-------------------------------|
| **Front_Sensor**   | Generates 0 when someone exits and 1 otherwise                                                        | Input   | 0, 1                          |
| **Back_Sensor**    | Generates 0 when someone enters and 1 otherwise                                                       | Input   | 0, 1                          |
| **T1**             | Teller 1 availability (0: unavailable, 1: available)                                                 | Input   | 0, 1                          |
| **T2**             | Teller 2 availability (0: unavailable, 1: available)                                                 | Input   | 0, 1                          |
| **T3**             | Teller 3 availability (0: unavailable, 1: available)                                                 | Input   | 0, 1                          |
| **Pcount**         | Number of Customers in the queue                                                                     | Output  | 0, 1, 2, 3, 4, 5, 6, 7        |
| **Tcount**         | Number of available tellers                                                                           | Output  | 1, 2, 3                       |
| **Wtime**          | Expected waiting time before being served: $$Wtime = \begin{cases} 0 & \text{if } Pcount = 0 \\ \frac{3 \cdot (Pcount + Tcount - 1)}{Tcount} & \text{if } Pcount \neq 0 \end{cases}$$ | Output  | 0 --> 21                       |
| **Full_Flag**      | Queue capacity flag (0: not full, 1: full queue)                                                      | Output  | 0, 1                          |
| **Empty_Flag**     | Queue capacity flag (0: not empty, 1: empty queue)                                                    | Output  | 0, 1                          |
| **Full_Alarm**     | Entry overflow attempt (0: no entry attempt, 1: entry attempt while full)                             | Output  | 0, 1                          |
| **Empty_Alarm**    | Underflow exit attempt (0: no exit attempt, 1: exit attempt while empty)                              | Output  | 0, 1                          |

---


## 💻 How to Run the Simulation
- ### Prerequisites:
    Siemens QuestaSim / ModelSim (or any standard Verilog simulator like Icarus Verilog).

- ### Compilation:
    Compile all Verilog files in your project directory:
    ```bash
    vlog *.v
    ```
- ### Run Simulation:
    Simulate the top-level testbench:
    ```bash
    vsim ITIBQS_tb
    run -all
    ```

## 📊 Sample Simulation Log Output
```
 ---------------------------------------- Test Bench ---------------------------------------
 Time | rstn | frontSensor | backSensor | emptyFlag | fullFlag | emptyAlarm | fullAlarm | PcountDisplay
    0 |    0 |           1 |          1 |         1 |        0 |          0 |         0 |       1111110
  100 |    1 |           1 |          1 |         1 |        0 |          0 |         0 |       1111110
  300 |    1 |           0 |          1 |         1 |        0 |          0 |         0 |       1111110
  350 |    1 |           0 |          1 |         1 |        0 |          1 |         0 |       1111110
  400 |    1 |           1 |          1 |         1 |        0 |          1 |         0 |       1111110
  450 |    1 |           1 |          1 |         1 |        0 |          0 |         0 |       1111110
  500 |    1 |           1 |          0 |         1 |        0 |          0 |         0 |       1111110
  600 |    1 |           1 |          1 |         1 |        0 |          0 |         0 |       1111110
  650 |    1 |           1 |          1 |         0 |        0 |          0 |         0 |       0110000
```