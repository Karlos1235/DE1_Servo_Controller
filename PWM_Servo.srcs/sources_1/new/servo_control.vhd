library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity servo_control is
    Port ( CLK       : in  STD_LOGIC; -- Main clock signal
           BTNC      : in  STD_LOGIC; -- Button BTNC
           BTND      : in  STD_LOGIC; -- Button BTND
           BTNL      : in  STD_LOGIC; -- Button BTNL
           BTNU      : in  STD_LOGIC; -- Button BTNU
           JA        : out  STD_LOGIC; -- Signal for servo JA
           JB        : out  STD_LOGIC; -- Signal for servo JB
           JC        : out  STD_LOGIC; -- Signal for servo JC
           JD        : out  STD_LOGIC); -- Signal for servo JD
end servo_control;

architecture Behavioral of servo_control is
    constant CLK_FREQ       : integer := 100000000; -- Clock frequency in Hz
    constant PWM_FREQ       : integer := 50;         -- PWM frequency in Hz
    constant PWM_PERIOD     : integer := CLK_FREQ / (2 * PWM_FREQ);  -- PWM period
    constant ANGLE_STEP     : integer := 5;          -- Angle step size

    signal servo_angle_JA   : integer range 0 to 180 := 90;  -- Initial angle for servo JA
    signal servo_angle_JB   : integer range 0 to 180 := 90;  -- Initial angle for servo JB
    signal servo_angle_JC   : integer range 0 to 180 := 90;  -- Initial angle for servo JC
    signal servo_angle_JD   : integer range 0 to 180 := 90;  -- Initial angle for servo JD

    signal pwm_counter      : integer range 0 to PWM_PERIOD; -- Counter for PWM signal
    signal pwm_pulse        : STD_LOGIC := '0'; -- PWM signal state toggling

begin

    -- Process to generate PWM signal
    PWM_process : process(CLK)
    begin
        if rising_edge(CLK) then
            if pwm_counter < servo_angle_JA then
                JA <= '1'; -- Activate signal for servo JA
            else
                JA <= '0'; -- Deactivate signal for servo JA
            end if;
           
            if pwm_counter < servo_angle_JB then
                JB <= '1'; -- Activate signal for servo JB
            else
                JB <= '0'; -- Deactivate signal for servo JB
            end if;
           
            if pwm_counter < servo_angle_JC then
                JC <= '1';
            else
                JC <= '0';
            end if;
           
            if pwm_counter < servo_angle_JD then
                JD <= '1';
            else
                JD <= '0';
            end if;

            if pwm_counter = PWM_PERIOD - 1 then
                pwm_counter <= 0; -- Reset counter when end of period is reached
                pwm_pulse <= not pwm_pulse; -- Toggle PWM signal state
            else
                pwm_counter <= pwm_counter + 1;
            end if;
        end if;
    end process;

    -- Process for button control
    button_process : process(BTNC, BTND, BTNL, BTNU)
    begin
        if BTNC = '1' then
            servo_angle_JA <= servo_angle_JA - ANGLE_STEP; -- Decrease angle for servo JA
            if servo_angle_JA < 0 then
                servo_angle_JA <= 0; -- Protection against negative angles for servo JA
            end if;
        elsif BTND = '1' then
            servo_angle_JA <= servo_angle_JA + ANGLE_STEP; -- Increase angle for servo JA
            if servo_angle_JA > 180 then
                servo_angle_JA <= 180; -- Protection against exceeding maximum angle for servo JA
            end if;
        end if;
       
        if BTNL = '1' then
            servo_angle_JB <= servo_angle_JB - ANGLE_STEP;
            if servo_angle_JB < 0 then
                servo_angle_JB <= 0;
            end if;
        elsif BTNU = '1' then
            servo_angle_JB <= servo_angle_JB + ANGLE_STEP;
            if servo_angle_JB > 180 then
                servo_angle_JB <= 180;
            end if;
        end if;
    end process;

end Behavioral;
