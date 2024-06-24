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
        -- Top-level bus nfa_dfa_Control signals
        nfa_dfa_Control_Valid: out T_SYSTEM_BOOL;
        nfa_dfa_Control_Reset: out T_SYSTEM_BOOL;
        nfa_dfa_Control_Length: out T_SYSTEM_INT32;
        nfa_dfa_Control_Array: out nfa_dfa_Control_Array_type;

        -- Top-level bus nfa_dfa_Traversal signals
        nfa_dfa_Traversal_Valid: in T_SYSTEM_BOOL;

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
    signal FIN_nfa_dfa_Traverse : std_logic;

    signal tmp_nfa_dfa_Control_Valid: T_SYSTEM_BOOL;
    signal tmp_nfa_dfa_Control_Reset: T_SYSTEM_BOOL;
    signal tmp_nfa_dfa_Control_Length: T_SYSTEM_INT32;
    signal tmp_nfa_dfa_Control_Array: nfa_dfa_Control_Array_type;

    -- The primary ready driver signal
    signal RDY : std_logic;

begin

    -- Entity nfa_dfa.Traverse signals
    nfa_dfa_Traverse: entity work.nfa_dfa_Traverse
    generic map(
        reset_transitions (0 to 35) => (TO_UNSIGNED(48, 8), TO_UNSIGNED(99, 8), TO_UNSIGNED(51, 8), TO_UNSIGNED(48, 8), TO_UNSIGNED(97, 8), TO_UNSIGNED(49, 8), TO_UNSIGNED(49, 8), TO_UNSIGNED(98, 8), TO_UNSIGNED(50, 8), TO_UNSIGNED(51, 8), TO_UNSIGNED(99, 8), TO_UNSIGNED(54, 8), TO_UNSIGNED(51, 8), TO_UNSIGNED(97, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(50, 8), TO_UNSIGNED(97, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(98, 8), TO_UNSIGNED(53, 8), TO_UNSIGNED(53, 8), TO_UNSIGNED(97, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(53, 8), TO_UNSIGNED(99, 8), TO_UNSIGNED(54, 8), TO_UNSIGNED(50, 8), TO_UNSIGNED(99, 8), TO_UNSIGNED(54, 8), TO_UNSIGNED(54, 8), TO_UNSIGNED(97, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(54, 8), TO_UNSIGNED(99, 8), TO_UNSIGNED(54, 8)),
        reset_acceptStates (0 to 3) => (TO_UNSIGNED(50, 8), TO_UNSIGNED(51, 8), TO_UNSIGNED(53, 8), TO_UNSIGNED(54, 8)),
        reset_startState => TO_UNSIGNED(48, 8),
        reset_states (0 to 6) => (TO_UNSIGNED(48, 8), TO_UNSIGNED(49, 8), TO_UNSIGNED(50, 8), TO_UNSIGNED(51, 8), TO_UNSIGNED(52, 8), TO_UNSIGNED(53, 8), TO_UNSIGNED(54, 8))
    )
    port map (
        -- Input bus nfa_dfa_Control
        control_Valid => tmp_nfa_dfa_Control_Valid,
        control_Reset => tmp_nfa_dfa_Control_Reset,
        control_Length => tmp_nfa_dfa_Control_Length,
        control_Array => tmp_nfa_dfa_Control_Array,

        -- Output bus nfa_dfa_Traversal
        traversal_Valid => nfa_dfa_Traversal_Valid,

        CLK => CLK,
        RDY => RDY,
        FIN => FIN_nfa_dfa_Traverse,
        ENB => ENB,
        RST => RST
    );

    -- Connect ready signals

    -- Setup the FIN feedback signals
    FIN <= FIN_nfa_dfa_Traverse;

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

    -- Propegate tmp signals
    nfa_dfa_Control_Valid <= tmp_nfa_dfa_Control_Valid;
    nfa_dfa_Control_Reset <= tmp_nfa_dfa_Control_Reset;
    nfa_dfa_Control_Length <= tmp_nfa_dfa_Control_Length;
    nfa_dfa_Control_Array <= tmp_nfa_dfa_Control_Array;

    -- User defined processes here
    -- #### USER-DATA-CODE-START
    -- #### USER-DATA-CODE-END

end RTL;