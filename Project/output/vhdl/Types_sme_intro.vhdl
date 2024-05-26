library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

package CUSTOM_TYPES is

    -- User defined types here
    -- #### USER-DATA-CORETYPES-START
    -- #### USER-DATA-CORETYPES-END

    -- Type definitions
    subtype Traverse_transitions_type is T_SYSTEM_UINT8_ARRAY;
    subtype Traverse_acceptStates_type is T_SYSTEM_UINT8_ARRAY;
    subtype Traverse_states_type is T_SYSTEM_UINT8_ARRAY;

    -- Bus array definitions
    subtype Control_Array_type is T_SYSTEM_UINT8_ARRAY(0 to 1000 - 1);

    -- User defined types here
    -- #### USER-DATA-TRAILTYPES-START
    -- #### USER-DATA-TRAILTYPES-END

end CUSTOM_TYPES;

package body CUSTOM_TYPES is

    -- User defined bodies here
    -- #### USER-DATA-BODY-START
    -- #### USER-DATA-BODY-END

end CUSTOM_TYPES;