library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

-- library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

entity sme_intro is
    port(
        -- Top-level bus Control signals
        Control_Valid: in T_SYSTEM_BOOL;
        Control_Reset: in T_SYSTEM_BOOL;
        Control_Character: in T_SYSTEM_UINT8;

        -- Top-level bus Count signals
        Count_Count: out T_SYSTEM_UINT32;
        Count_CompareCharacter: out T_SYSTEM_UINT32;

        -- Interconnection bus OrCounter signals
        OrCounter_Counter: inout T_SYSTEM_UINT32;
        OrCounter_Comparison0: inout T_SYSTEM_UINT32;
        OrCounter_Comparison1: inout T_SYSTEM_UINT32;
        OrCounter_Status: inout T_SYSTEM_BOOL;

        -- User defined signals here
        -- #### USER-DATA-ENTITYSIGNALS-START
        -- #### USER-DATA-ENTITYSIGNALS-END

        -- Enable signal
        ENB : in Std_logic;

        -- Finished signal
        FIN : out Std_logic;

        -- Reset signal
        RST : in Std_logic;

        -- Clock signal
        CLK : in Std_logic
    );
end sme_intro;

architecture RTL of sme_intro is

    -- User defined signals here
    -- #### USER-DATA-SIGNALS-START
    -- #### USER-DATA-SIGNALS-END

    -- Process ready triggers
    signal FIN_Counter : std_logic;
    signal FIN_OrClass : std_logic;

    -- The primary ready driver signal
    signal RDY : std_logic;

begin

    -- Entity Counter signals
    Counter: entity work.Counter
    generic map(
        reset_internal_count => TO_UNSIGNED(0, 32)
    )
    port map (
        -- Input bus Control
        control_Valid => Control_Valid,
        control_Reset => Control_Reset,
        control_Character => Control_Character,

        -- Output bus Count
        count_CompareCharacter => Count_CompareCharacter,
        count_Count => Count_Count,

        CLK => CLK,
        RDY => RDY,
        FIN => FIN_Counter,
        ENB => ENB,
        RST => RST
    );

    -- Entity OrClass signals
    OrClass: entity work.OrClass
    generic map(
        reset_internal_count => TO_UNSIGNED(0, 32),
        reset_status => '0'
    )
    port map (
        -- Input bus Control
        control_Valid => Control_Valid,
        control_Reset => Control_Reset,
        control_Character => Control_Character,

        -- Output bus OrCounter
        orcounter_Counter => OrCounter_Counter,
        orcounter_Status => OrCounter_Status,
        orcounter_Comparison0 => OrCounter_Comparison0,
        orcounter_Comparison1 => OrCounter_Comparison1,

        CLK => CLK,
        RDY => RDY,
        FIN => FIN_OrClass,
        ENB => ENB,
        RST => RST
    );

    -- Connect ready signals

    -- Setup the FIN feedback signals
    FIN <= FIN_Counter when FIN_OrClass = FIN_Counter;

    -- Propagate all clocked and feedback signals
    process(
        CLK,
        RST
    )
        variable readyflag: std_logic;
    begin
        if RST = '1' then
            RDY <= '0';
            readyflag := '0';
        elsif rising_edge(CLK) then
            if ENB = '1' then
                readyflag := not readyflag;
                RDY <= readyflag;
            end if;
        end if;
    end process;

    -- User defined processes here
    -- #### USER-DATA-CODE-START
    -- #### USER-DATA-CODE-END

end RTL;