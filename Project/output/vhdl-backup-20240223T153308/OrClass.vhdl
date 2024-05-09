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

entity OrClass is
    generic(
        reset_internal_count: in T_SYSTEM_UINT32;
        reset_status: in T_SYSTEM_BOOL
    );
    port(
        -- Input bus control signals
        control_Valid: in T_SYSTEM_BOOL;
        control_Reset: in T_SYSTEM_BOOL;
        control_Character: in T_SYSTEM_UINT8;

        -- Output bus orcounter signals
        orcounter_Counter: out T_SYSTEM_UINT32;
        orcounter_Status: out T_SYSTEM_BOOL;
        orcounter_Comparison0: out T_SYSTEM_UINT32;
        orcounter_Comparison1: out T_SYSTEM_UINT32;

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
end OrClass;

architecture RTL of OrClass is 

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
        variable internal_count : T_SYSTEM_UINT32 := reset_internal_count;
        variable status : T_SYSTEM_BOOL := reset_status;


        -- #### USER-DATA-NONCLOCKEDVARIABLES-START
        -- #### USER-DATA-NONCLOCKEDVARIABLES-END
    begin
        -- Initialize code here
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-START
        -- #### USER-DATA-NONCLOCKEDSHAREDINITIALIZECODE-END

        if RST = '1' then
            orcounter_Counter <= TO_UNSIGNED(0, 32);
            orcounter_Status <= '0';
            orcounter_Comparison0 <= TO_UNSIGNED(0, 32);
            orcounter_Comparison1 <= TO_UNSIGNED(0, 32);
            internal_count := reset_internal_count;
            status := reset_status;
            FIN <= '0';

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDRESETCODE-START
            -- #### USER-DATA-NONCLOCKEDRESETCODE-END

        elsif rising_edge(CLK) then

            -- Initialize code here
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-START
            -- #### USER-DATA-NONCLOCKEDINITIALIZECODE-END

            status := '0';
            if control_Reset = '1' then
                internal_count := TO_UNSIGNED(0, 32);
            else
                if ((control_Valid) = '1') and ((control_Character = resize(orcounter_Comparison0, T_SYSTEM_UINT8'length)) or (control_Character = resize(orcounter_Comparison1, T_SYSTEM_UINT8'length))) then
                    internal_count := internal_count + TO_UNSIGNED(1, 32);
                    status := '1';
                end if;
            end if;
            orcounter_Counter <= internal_count;
            orcounter_Status <= status;

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
