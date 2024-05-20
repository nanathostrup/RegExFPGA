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

        -- Top-level bus Traversal signals
        Traversal_Count: out T_SYSTEM_UINT32;

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
    signal FIN_Traverse : std_logic;

    -- The primary ready driver signal
    signal RDY : std_logic;

begin

    -- Entity Traverse signals
    Traverse: entity work.Traverse
    generic map(
        reset_internal_count => TO_UNSIGNED(0, 32)
    )
    port map (
        -- Input bus Control
        control_Valid => Control_Valid,
        control_Reset => Control_Reset,

        -- Output bus Traversal
        traversal_Count => Traversal_Count,

        CLK => CLK,
        RDY => RDY,
        FIN => FIN_Traverse,
        ENB => ENB,
        RST => RST
    );

    -- Connect ready signals

    -- Setup the FIN feedback signals
    FIN <= FIN_Traverse;

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