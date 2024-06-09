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

entity Traverse is
    generic(
        reset_transitions: in Traverse_transitions_type;
        reset_acceptStates: in Traverse_acceptStates_type;
        reset_startState: in T_SYSTEM_UINT8;
        reset_states: in Traverse_states_type
    );
    port(
        -- Input bus control signals
        control_Valid: in T_SYSTEM_BOOL;
        control_Reset: in T_SYSTEM_BOOL;
        control_Length: in T_SYSTEM_INT32;
        control_Array: in Control_Array_type;

        -- Output bus traversal signals
        traversal_Valid: out T_SYSTEM_BOOL;

        -- Clock signal
        CLK : in Std_logic;

        -- Ready signal
        RDY : in Std_logic;

        -- Finished signal
        FIN : out Std_logic;

        -- Enable signal
        ENB : in Std_logic;

        -- Reset signal
        RST : in Std_logic
    );
end Traverse;

architecture RTL of Traverse is 

    -- User defined signals, procedures and components here
    -- #### USER-DATA-SIGNALS-START
    -- #### USER-DATA-SIGNALS-END

begin

    -- Custom processes go here
    -- #### USER-DATA-PROCESSES-START
    -- #### USER-DATA-PROCESSES-END

    process(
        -- Custom sensitivity signals here
        -- #### USER-DATA-SENSITIVITY-START
        -- #### USER-DATA-SENSITIVITY-END
        CLK,
        RST
    )
        -- Internal variables
        variable transitions : Traverse_transitions_type (0 to 35) := reset_transitions;
        variable acceptStates : Traverse_acceptStates_type (0 to 3) := reset_acceptStates;
        variable startState : T_SYSTEM_UINT8 := reset_startState;
        variable states : Traverse_states_type (0 to 6) := reset_states;

        -- Internal methods
        pure function TraverseDFA() return T_SYSTEM_BOOL is
            variable TraverseDFA_tmpvar_0: T_SYSTEM_BOOL;
            variable TraverseDFA_inputLength: T_SYSTEM_INT32;
            variable TraverseDFA_currentState: T_SYSTEM_UINT8;
            variable TraverseDFA_counter: T_SYSTEM_INT32;
            variable TraverseDFA_transLength: T_SYSTEM_INT32;
            variable TraverseDFA_running_j: T_SYSTEM_BOOL;
            variable TraverseDFA_running_i: T_SYSTEM_BOOL;
            variable TraverseDFA_transitionFound: T_SYSTEM_BOOL;
            variable TraverseDFA_i_offset: T_SYSTEM_INT32;
            variable TraverseDFA_this_i: T_SYSTEM_INT32;
            variable TraverseDFA_symbolStr: T_SYSTEM_UINT8;
        begin
            TraverseDFA_inputLength := control_Length;
            TraverseDFA_currentState := startState;
            TraverseDFA_counter := TO_SIGNED(0, 32);
            TraverseDFA_transLength := TO_SIGNED(transitions'LENGTH, 32) / TO_SIGNED(3, 32);
            TraverseDFA_running_j := '1';
            TraverseDFA_running_i := '1';
            TraverseDFA_transitionFound := '0';
            TraverseDFA_i_offset := TO_SIGNED(0, 32);
            for TraverseDFA_start in 0 to 1000-1 loop
                TraverseDFA_currentState := startState;
                TraverseDFA_running_i := '1';
                TraverseDFA_i_offset := TO_SIGNED(0, 32);
                for TraverseDFA_i in 0 to 1000-1 loop
                    TraverseDFA_this_i := TO_SIGNED(TraverseDFA_i, 32) + TraverseDFA_i_offset;
                    if ((TraverseDFA_running_i = '1') and (TraverseDFA_this_i >= TO_SIGNED(TraverseDFA_start, 32))) and (TraverseDFA_this_i < TraverseDFA_inputLength) then
                        TraverseDFA_transitionFound := '0';
                        TraverseDFA_symbolStr := control_Array(TO_INTEGER(TraverseDFA_this_i));
                        TraverseDFA_counter := TO_SIGNED(0, 32);
                        TraverseDFA_running_j := '1';
                        for TraverseDFA_j in 0 to 1000-1 loop
                            if (TraverseDFA_running_j = '1') and (TO_SIGNED(TraverseDFA_j, 32) < TraverseDFA_transLength) then
                                if (transitions(TO_INTEGER(((resize(TO_SIGNED(3, 32) * TO_SIGNED(TraverseDFA_j, 32), 32)) + TO_SIGNED(0, 32)))) = TraverseDFA_currentState) and (transitions(TO_INTEGER(((resize(TO_SIGNED(3, 32) * TO_SIGNED(TraverseDFA_j, 32), 32)) + TO_SIGNED(1, 32)))) = TraverseDFA_symbolStr) then
                                    TraverseDFA_transitionFound := '1';
                                    TraverseDFA_currentState := transitions(TO_INTEGER(((resize(TO_SIGNED(3, 32) * TO_SIGNED(TraverseDFA_j, 32), 32)) + TO_SIGNED(2, 32))));
                                    for TraverseDFA_h in 0 to 4-1 loop
                                        if TraverseDFA_currentState = acceptStates(TraverseDFA_h) then
                                            TraverseDFA_tmpvar_0 := '1';
                                            return TraverseDFA_tmpvar_0;
                                        end if;
                                    end loop;
                                    TraverseDFA_running_j := '0';
                                end if;
                            end if;
                        end loop;
                        TraverseDFA_counter := TraverseDFA_counter + TO_SIGNED(1, 32);
                        for TraverseDFA_h2 in 0 to 4-1 loop
                            if TraverseDFA_currentState = acceptStates(TraverseDFA_h2) then
                                TraverseDFA_tmpvar_0 := '1';
                                return TraverseDFA_tmpvar_0;
                            end if;
                        end loop;
                        if not (TraverseDFA_transitionFound = '1') then
                            TraverseDFA_running_i := '0';
                            TraverseDFA_i_offset := - TraverseDFA_counter;
                        end if;
                    end if;
                end loop;
            end loop;
            for TraverseDFA_h3 in 0 to 4-1 loop
                if TraverseDFA_currentState = acceptStates(TraverseDFA_h3) then
                    TraverseDFA_tmpvar_0 := '1';
                    return TraverseDFA_tmpvar_0;
                end if;
            end loop;
            TraverseDFA_tmpvar_0 := '0';
            return TraverseDFA_tmpvar_0;
        end TraverseDFA;


        -- #### USER-DATA-NONCLOCKEDVARIABLES-START
        -- #### USER-DATA-NONCLOCKEDVARIABLES-END
    begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            traversal_Valid <= '0';
            transitions := reset_transitions;
            acceptStates := reset_acceptStates;
            startState := reset_startState;
            states := reset_states;
            FIN <= '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END

            if control_Reset = '1' then
                traversal_Valid <= '0';
            else
                if control_Valid = '1' then
                    if TraverseDFA = '1' then
                        traversal_Valid <= '1';
                    else
                        traversal_Valid <= '0';
                    end if;
                end if;
            end if;

            FIN <= not RDY;

        end if;

        -- Non-clocked process actions here
        -- #### USER-DATA-CODE-START
        -- #### USER-DATA-CODE-END

    end process;

end RTL;

-- User defined architectures here
-- #### USER-DATA-ARCH-START
-- #### USER-DATA-ARCH-END
