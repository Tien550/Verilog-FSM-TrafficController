`timescale 1ns / 1ps

module traffic_light_fsm (
    input wire clk,
    input wire rst_n,
    output reg [2:0] light // [2]: Red, [1]: Yellow, [0]: Green
);

    // State Encoding
    localparam STATE_GREEN  = 2'b00;
    localparam STATE_YELLOW = 2'b01;
    localparam STATE_RED    = 2'b10;

    reg [1:0] current_state, next_state;
    reg [3:0] timer; // Simple timer for state transitions

    // Sequential Logic: State transition & Timer
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= STATE_RED;
            timer <= 0;
        end else begin
            current_state <= next_state;
            if (current_state != next_state)
                timer <= 0; // Reset timer on state change
            else
                timer <= timer + 1;
        end
    end

    // Combinational Logic: Next State Logic
    always @(*) begin
        next_state = current_state; // Default
        case (current_state)
            STATE_GREEN:  if (timer >= 10) next_state = STATE_YELLOW;
            STATE_YELLOW: if (timer >= 3)  next_state = STATE_RED;
            STATE_RED:    if (timer >= 12) next_state = STATE_GREEN;
            default: next_state = STATE_RED;
        endcase
    end

    // Combinational Logic: Output Logic
    always @(*) begin
        case (current_state)
            STATE_GREEN:  light = 3'b001;
            STATE_YELLOW: light = 3'b010;
            STATE_RED:    light = 3'b100;
            default:      light = 3'b100;
        endcase
    end

endmodule
