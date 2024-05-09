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

entity sme_intro_export is
    port(
        -- Top-level bus Control signals
        Control_Valid: in STD_LOGIC;
        Control_Reset: in STD_LOGIC;
        Control_Character: in STD_LOGIC_VECTOR(7 downto 0);

        -- Top-level bus Count signals
        Count_Count: out STD_LOGIC_VECTOR(31 downto 0);
        Count_CompareCharacter: out STD_LOGIC_VECTOR(31 downto 0);

        -- User defined signals here
        -- #### USER-DATA-ENTITYSIGNALS-START
        -- #### USER-DATA-ENTITYSIGNALS-END

        -- Enable signal
        ENB : in STD_LOGIC;

        -- Reset signal
        RST : in STD_LOGIC;

        -- Finished signal
        FIN : out Std_logic;

        -- Clock signal
        CLK : in STD_LOGIC
    );
end sme_intro_export;

architecture RTL of sme_intro_export is

    -- User defined signals here
    -- #### USER-DATA-SIGNALS-START
    -- #### USER-DATA-SIGNALS-END

    -- Intermediate conversion signal to convert internal types to external ones
    signal tmp_Count_Count : T_SYSTEM_UINT32;
    signal tmp_Count_CompareCharacter : T_SYSTEM_UINT32;

begin

    -- Carry converted signals from entity to wrapped outputs
    Count_Count <= std_logic_vector(tmp_Count_Count);
    Count_CompareCharacter <= std_logic_vector(tmp_Count_CompareCharacter);

    -- Entity sme_intro signals
    sme_intro: entity work.sme_intro
    port map (
        -- Input bus Control
        Control_Valid => Control_Valid,
        Control_Reset => Control_Reset,
        Control_Character => unsigned(Control_Character),

        -- Output bus Count
        Count_Count => tmp_Count_Count,
        Count_CompareCharacter => tmp_Count_CompareCharacter,

        ENB => ENB,
        RST => RST,
        FIN => FIN,
        CLK => CLK
    );

-- User defined processes here
-- #### USER-DATA-CODE-START
-- #### USER-DATA-CODE-END

end RTL;