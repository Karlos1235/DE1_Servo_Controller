library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_pwm_clk64kHz is
    PORT(
        clk  : IN  STD_LOGIC; -- Input clock signal
        reset: IN  STD_LOGIC; -- Reset signal
        sw : in std_logic_vector(3 downto 0); -- Input switches
        pos  : IN  STD_LOGIC_VECTOR(6 downto 0); -- Input position signal
        LED : out std_logic_vector(3 downto 0); -- Output LED display
        LED_P : out std_logic_vector(6 downto 0); -- Output LED display for position
        servo_t: OUT STD_LOGIC_vector(3 downto 0) -- Output servo signal
    );
end servo_pwm_clk64kHz;

architecture Behavioral of servo_pwm_clk64kHz is
    -- Declaration of components used within the architecture
    COMPONENT clk64kHz
        PORT(
            clk    : in  STD_LOGIC; -- Input clock signal
            reset  : in  STD_LOGIC; -- Reset signal
            clk_out: out STD_LOGIC -- Output clock signal
        );
    END COMPONENT;
    
    COMPONENT servo_pwm
        PORT (
            clk   : IN  STD_LOGIC; -- Input clock signal
            reset : IN  STD_LOGIC; -- Reset signal
            pos   : IN  STD_LOGIC_VECTOR(6 downto 0); -- Input position signal
            servo : OUT STD_LOGIC -- Output servo signal
        );
    END COMPONENT;

    -- Declaration of internal signals used within the architecture
    signal clk_out : STD_LOGIC := '0'; -- Clock output signal
    signal servo_out : STD_LOGIC := '0'; -- Servo output signal
begin
    clk64kHz_map: clk64kHz PORT MAP(
        clk => clk, -- Connects the external clock signal to the component
        reset => reset, -- Connects the reset signal to the component
        clk_out => clk_out -- Connects the output clock signal to internal signal
    );
    
    servo_pwm_map: servo_pwm PORT MAP(
        clk => clk_out, -- Connects the internal clock signal to the component
        reset => reset, -- Connects the reset signal to the component
        pos => pos, -- Connects the position signal to the component
        servo => servo_out -- Connects the output servo signal to internal signal
    );

  -- Assigning switch values to LED outputs      
  LED(0) <= sw(0);
  LED(1) <= sw(1);
  LED(2) <= sw(2);
  LED(3) <= sw(3);

  -- Assigning position values to LED_P outputs
  LED_P(0) <= pos(0);
  LED_P(1) <= pos(1);
  LED_P(2) <= pos(2);
  LED_P(3) <= pos(3);
  LED_P(4) <= pos(4);
  LED_P(5) <= pos(5);
  LED_P(6) <= pos(6);

  -- Multiplexing servo output based on switch values
  servo_t(0) <= servo_out when sw = "1000" else '0';
  servo_t(1) <= servo_out when sw = "0100" else '0';
  servo_t(2) <= servo_out when sw = "0010" else '0';
  servo_t(3) <= servo_out when sw = "0001" else '0';
end Behavioral;
