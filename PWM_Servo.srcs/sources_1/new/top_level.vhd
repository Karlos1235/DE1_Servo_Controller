library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port (
        CLK       : in  STD_LOGIC; -- Clock input
        BTNC      : in  STD_LOGIC; 
        BTND      : in  STD_LOGIC;
        BTNL      : in  STD_LOGIC;
        BTNU      : in  STD_LOGIC;
        JA        : out  STD_LOGIC;
        JB        : out  STD_LOGIC;
        JC        : out  STD_LOGIC;
        JD        : out  STD_LOGIC
    );
end top_level;

architecture Behavioral of top_level is

    -- Declaration of the servo_control component
    component servo_control
        Port (
            CLK       : in  STD_LOGIC;
            BTNC      : in  STD_LOGIC;
            BTND      : in  STD_LOGIC;
            BTNL      : in  STD_LOGIC;
            BTNU      : in  STD_LOGIC;
            JA        : out  STD_LOGIC;
            JB        : out  STD_LOGIC;
            JC        : out  STD_LOGIC;
            JD        : out  STD_LOGIC
        );
    end component;

    -- Declaration of internal signals
    signal JA_internal, JB_internal, JC_internal, JD_internal: STD_LOGIC;

begin

    -- Instantiation of the servo_control component
    servo_inst : servo_control
        port map (
            CLK   => CLK,
            BTNC  => BTNC,
            BTND  => BTND,
            BTNL  => BTNL,
            BTNU  => BTNU,
            JA    => JA_internal,
            JB    => JB_internal,
            JC    => JC_internal,
            JD    => JD_internal
        );

    -- Mapping internal signals to outputs
    JA <= JA_internal;
    JB <= JB_internal;
    JC <= JC_internal;
    JD <= JD_internal;

end Behavioral;
