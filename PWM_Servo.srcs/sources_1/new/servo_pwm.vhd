library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    PORT (
        clk   : IN  STD_LOGIC; -- Input clock signal
        reset : IN  STD_LOGIC; -- Input signal for reset
        pos   : IN  STD_LOGIC_VECTOR(6 downto 0); -- Input signal for servo position
        servo : OUT STD_LOGIC -- Output signal for servo control
    );
end servo_pwm;

architecture Behavioral of servo_pwm is
    signal cnt : unsigned(10 downto 0); -- Counter, from 0 to 1279.
    signal pwmi: unsigned(7 downto 0); -- Temporal signal used to generate the PWM pulse.
begin
    pwmi <= unsigned('0' & pos) + 32; -- Minimum value should be 0.5ms.
    counter: process (reset, clk) begin -- Counter process, from 0 to 1279.
        if (reset = '1') then
            cnt <= (others => '0'); -- If reset is active, set counter to 0
        elsif rising_edge(clk) then -- On each rising clock edge, increment the counter
            if (cnt = 1279) then
                cnt <= (others => '0'); -- If counter reaches 1279, reset to 0
            else
                cnt <= cnt + 1; -- Otherwise, increment the counter by 1
            end if;
        end if;
    end process;

    servo <= '1' when (cnt < pwmi) else '0'; -- Output signal for the servomotor.
end Behavioral;
