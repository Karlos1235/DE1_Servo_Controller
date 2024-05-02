library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clk64kHz is
    Port (
        clk    : in  STD_LOGIC; -- Vstupní hodinový signál
        reset  : in  STD_LOGIC; -- Reset signál pro resetování čítače
        clk_out: out STD_LOGIC  -- Výstupní signál s frekvencí 64kHZ
    );
end clk64kHz;
 
architecture Behavioral of clk64kHz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 780 := 0;
begin
    freq_divider: process (reset, clk) begin
        if (reset = '1') then
            temporal <= '0';
            counter  <= 0;
        elsif rising_edge(clk) then
            if (counter = 780) then
                temporal <= NOT(temporal);
                counter  <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
 
    clk_out <= temporal;
end Behavioral;
