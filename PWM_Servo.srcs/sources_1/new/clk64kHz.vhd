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
    signal temporal: STD_LOGIC; -- Pomocný signál pro uchování stavu
    signal counter : integer range 0 to 780 := 0; -- Čítač impulsů
begin
    freq_divider: process (reset, clk) begin -- Proces pro dělení frekvence
        if (reset = '1') then -- Pokud je reset aktivní
            temporal <= '0'; -- Nastavíme výstupní signál na nulu
            counter  <= 0; -- Resetujeme čítač
        elsif rising_edge(clk) then -- Na náběžné hraně
            if (counter = 780) then -- Pokud čítač dosáhne maxima
                temporal <= NOT(temporal); -- Invertujeme výstupní signál
                counter  <= 0; -- Resetujeme čítač
            else
                counter <= counter + 1; --Jinak inkrementujeme čítač
            end if;
        end if;
    end process;
 
    clk_out <= temporal; -- Připojení výstupního signálu k výstupnímu portu
end Behavioral;
