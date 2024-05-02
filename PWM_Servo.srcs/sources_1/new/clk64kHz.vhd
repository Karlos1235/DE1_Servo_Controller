library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clk64kHz is
    Port (
        clk    : in  STD_LOGIC; -- Input clock signal
        reset  : in  STD_LOGIC; -- Reset signal for resetting the counter
        clk_out: out STD_LOGIC  -- Output signal with frequency 64kHZ
    );
end clk64kHz;
 
architecture Behavioral of clk64kHz is
    signal temporal: STD_LOGIC; -- Auxiliary signal for state holding
    signal counter : integer range 0 to 780 := 0; -- Counter for pulses
begin
    freq_divider: process (reset, clk) begin -- Process for frequency division
        if (reset = '1') then -- If reset is active
            temporal <= '0'; -- Set output signal to zero
            counter  <= 0; -- Reset the counter
        elsif rising_edge(clk) then -- On the rising edge
            if (counter = 780) then -- If the counter reaches maximum
                temporal <= NOT(temporal); -- Invert the output signal
                counter  <= 0; -- Reset the counter
            else
                counter <= counter + 1; -- Otherwise, increment the counter
            end if;
        end if;
    end process;
 
    clk_out <= temporal; -- Connect the output signal to the output port
end Behavioral;
