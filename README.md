# Verilog-FSM-TrafficController
Finite State Machine for Traffic Light Control in Verilog
# Verilog FSM Traffic Light Controller

A standard Finite State Machine (FSM) implemented in Verilog HDL, modeling a time-based traffic light intersection controller.

## Architecture
The design follows a strict separation of sequential and combinational logic blocks (Moore Machine architecture):
1. **State Memory (Sequential):** Updates the current state and handles the internal counter on the positive edge of the clock.
2. **Next State Logic (Combinational):** Determines the upcoming state based on the current state and timer values.
3. **Output Logic (Combinational):** Maps the active state to the physical traffic light output ([2]: Red, [1]: Yellow, [0]: Green).

## Verification
A standard testbench (tb_traffic_light.v) is included. It generates a 100MHz equivalent clock, handles asynchronous active-low reset assertion, and simulates a full traffic cycle spanning Green -> Yellow -> Red -> Green.

## Simulation Tools
This RTL code is synthesizer-agnostic and can be simulated using Vivado, ModelSim, or Icarus Verilog.
