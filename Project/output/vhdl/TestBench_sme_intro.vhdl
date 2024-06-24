library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;

--library SYSTEM_TYPES;
use work.SYSTEM_TYPES.ALL;

--library CUSTOM_TYPES;
use work.CUSTOM_TYPES.ALL;

use work.csv_util.all;

-- User defined packages here
-- #### USER-DATA-IMPORTS-START
-- #### USER-DATA-IMPORTS-END

entity sme_intro_tb is
end;

architecture TestBench of sme_intro_tb is

    signal CLOCK : Std_logic;
    signal StopClock : BOOLEAN;
    signal RESET : Std_logic;
    signal ENABLE : Std_logic;

    signal nfa_dfa_Control_Array : nfa_dfa_Control_Array_type;
    signal nfa_dfa_Control_Length : T_SYSTEM_INT32;
    signal nfa_dfa_Control_Reset : T_SYSTEM_BOOL;
    signal nfa_dfa_Control_Valid : T_SYSTEM_BOOL;
    signal nfa_dfa_Traversal_Valid : T_SYSTEM_BOOL;

begin

    uut: entity work.sme_intro
    port map (
        nfa_dfa_Control_Valid => nfa_dfa_Control_Valid,
        nfa_dfa_Control_Reset => nfa_dfa_Control_Reset,
        nfa_dfa_Control_Length => nfa_dfa_Control_Length,
        nfa_dfa_Control_Array => nfa_dfa_Control_Array,
        nfa_dfa_Traversal_Valid => nfa_dfa_Traversal_Valid,

        ENB => ENABLE,
        RST => RESET,
        CLK => CLOCK
    );

    Clk: process
    begin
        while not StopClock loop
            CLOCK <= '1';
            wait for 5 NS;
            CLOCK <= '0';
            wait for 5 NS;
        end loop;
        wait;
    end process;

    TraceFileTester: process

        file F: TEXT;
        variable L: LINE;
        variable Status: FILE_OPEN_STATUS;
        constant filename : string := "../trace.csv";
        variable clockcycle : integer := 0;
        variable tmp : CSV_LINE_T;
        variable readOK : boolean;
        variable fieldno : integer := 0;
        variable failures : integer := 0;
        variable newfailures: integer := 0;
        variable first_failure_tick : integer := -1;
        variable first_round : boolean := true;

    begin

        -- #### USER-DATA-CONDITONING-START
        -- #### USER-DATA-CONDITONING-END

        FILE_OPEN(Status, F, filename, READ_MODE);
        if Status /= OPEN_OK then
            report "Failed to open CSV trace file" severity Failure;
        else
            -- Verify the headers
            READLINE(F, L);

            fieldno := 0;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Traversal.Valid") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Traversal.Valid" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(0)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(0)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(1)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(1)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(2)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(2)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(3)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(3)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(4)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(4)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(5)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(5)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(6)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(6)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(7)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(7)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(8)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(8)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(9)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(9)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(10)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(10)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(11)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(11)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(12)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(12)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(13)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(13)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(14)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(14)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(15)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(15)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(16)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(16)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(17)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(17)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(18)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(18)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(19)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(19)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(20)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(20)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(21)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(21)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(22)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(22)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(23)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(23)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(24)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(24)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(25)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(25)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(26)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(26)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(27)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(27)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(28)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(28)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(29)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(29)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(30)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(30)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(31)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(31)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(32)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(32)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(33)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(33)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(34)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(34)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(35)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(35)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(36)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(36)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(37)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(37)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(38)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(38)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(39)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(39)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(40)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(40)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(41)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(41)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(42)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(42)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(43)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(43)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(44)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(44)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(45)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(45)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(46)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(46)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(47)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(47)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(48)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(48)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(49)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(49)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(50)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(50)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(51)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(51)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(52)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(52)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(53)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(53)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(54)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(54)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(55)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(55)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(56)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(56)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(57)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(57)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(58)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(58)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(59)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(59)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(60)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(60)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(61)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(61)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(62)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(62)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(63)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(63)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(64)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(64)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(65)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(65)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(66)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(66)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(67)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(67)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(68)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(68)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(69)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(69)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(70)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(70)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(71)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(71)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(72)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(72)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(73)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(73)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(74)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(74)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(75)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(75)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(76)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(76)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(77)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(77)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(78)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(78)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(79)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(79)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(80)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(80)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(81)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(81)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(82)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(82)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(83)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(83)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(84)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(84)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(85)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(85)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(86)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(86)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(87)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(87)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(88)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(88)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(89)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(89)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(90)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(90)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(91)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(91)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(92)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(92)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(93)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(93)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(94)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(94)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(95)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(95)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(96)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(96)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(97)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(97)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(98)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(98)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(99)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(99)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(100)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(100)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(101)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(101)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(102)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(102)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(103)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(103)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(104)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(104)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(105)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(105)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(106)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(106)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(107)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(107)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(108)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(108)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(109)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(109)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(110)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(110)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(111)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(111)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(112)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(112)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(113)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(113)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(114)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(114)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(115)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(115)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(116)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(116)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(117)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(117)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(118)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(118)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(119)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(119)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(120)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(120)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(121)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(121)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(122)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(122)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(123)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(123)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(124)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(124)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(125)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(125)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(126)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(126)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(127)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(127)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(128)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(128)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(129)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(129)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(130)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(130)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(131)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(131)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(132)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(132)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(133)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(133)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(134)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(134)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(135)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(135)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(136)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(136)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(137)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(137)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(138)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(138)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(139)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(139)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(140)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(140)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(141)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(141)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(142)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(142)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(143)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(143)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(144)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(144)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(145)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(145)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(146)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(146)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(147)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(147)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(148)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(148)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(149)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(149)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(150)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(150)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(151)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(151)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(152)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(152)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(153)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(153)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(154)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(154)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(155)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(155)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(156)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(156)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(157)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(157)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(158)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(158)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(159)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(159)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(160)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(160)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(161)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(161)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(162)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(162)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(163)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(163)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(164)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(164)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(165)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(165)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(166)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(166)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(167)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(167)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(168)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(168)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(169)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(169)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(170)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(170)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(171)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(171)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(172)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(172)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(173)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(173)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(174)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(174)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(175)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(175)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(176)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(176)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(177)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(177)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(178)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(178)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(179)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(179)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(180)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(180)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(181)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(181)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(182)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(182)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(183)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(183)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(184)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(184)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(185)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(185)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(186)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(186)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(187)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(187)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(188)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(188)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(189)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(189)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(190)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(190)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(191)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(191)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(192)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(192)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(193)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(193)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(194)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(194)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(195)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(195)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(196)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(196)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(197)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(197)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(198)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(198)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(199)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(199)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(200)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(200)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(201)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(201)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(202)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(202)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(203)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(203)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(204)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(204)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(205)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(205)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(206)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(206)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(207)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(207)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(208)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(208)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(209)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(209)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(210)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(210)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(211)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(211)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(212)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(212)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(213)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(213)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(214)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(214)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(215)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(215)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(216)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(216)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(217)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(217)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(218)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(218)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(219)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(219)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(220)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(220)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(221)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(221)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(222)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(222)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(223)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(223)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(224)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(224)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(225)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(225)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(226)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(226)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(227)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(227)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(228)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(228)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(229)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(229)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(230)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(230)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(231)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(231)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(232)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(232)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(233)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(233)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(234)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(234)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(235)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(235)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(236)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(236)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(237)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(237)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(238)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(238)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(239)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(239)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(240)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(240)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(241)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(241)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(242)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(242)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(243)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(243)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(244)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(244)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(245)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(245)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(246)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(246)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(247)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(247)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(248)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(248)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(249)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(249)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(250)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(250)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(251)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(251)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(252)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(252)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(253)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(253)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(254)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(254)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(255)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(255)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(256)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(256)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(257)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(257)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(258)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(258)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(259)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(259)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(260)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(260)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(261)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(261)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(262)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(262)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(263)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(263)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(264)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(264)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(265)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(265)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(266)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(266)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(267)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(267)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(268)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(268)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(269)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(269)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(270)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(270)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(271)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(271)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(272)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(272)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(273)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(273)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(274)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(274)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(275)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(275)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(276)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(276)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(277)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(277)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(278)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(278)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(279)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(279)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(280)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(280)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(281)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(281)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(282)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(282)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(283)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(283)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(284)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(284)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(285)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(285)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(286)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(286)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(287)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(287)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(288)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(288)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(289)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(289)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(290)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(290)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(291)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(291)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(292)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(292)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(293)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(293)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(294)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(294)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(295)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(295)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(296)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(296)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(297)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(297)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(298)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(298)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(299)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(299)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(300)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(300)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(301)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(301)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(302)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(302)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(303)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(303)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(304)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(304)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(305)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(305)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(306)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(306)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(307)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(307)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(308)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(308)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(309)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(309)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(310)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(310)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(311)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(311)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(312)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(312)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(313)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(313)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(314)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(314)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(315)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(315)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(316)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(316)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(317)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(317)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(318)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(318)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(319)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(319)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(320)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(320)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(321)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(321)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(322)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(322)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(323)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(323)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(324)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(324)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(325)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(325)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(326)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(326)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(327)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(327)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(328)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(328)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(329)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(329)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(330)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(330)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(331)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(331)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(332)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(332)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(333)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(333)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(334)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(334)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(335)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(335)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(336)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(336)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(337)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(337)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(338)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(338)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(339)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(339)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(340)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(340)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(341)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(341)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(342)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(342)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(343)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(343)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(344)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(344)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(345)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(345)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(346)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(346)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(347)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(347)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(348)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(348)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(349)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(349)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(350)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(350)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(351)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(351)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(352)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(352)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(353)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(353)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(354)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(354)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(355)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(355)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(356)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(356)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(357)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(357)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(358)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(358)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(359)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(359)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(360)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(360)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(361)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(361)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(362)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(362)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(363)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(363)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(364)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(364)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(365)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(365)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(366)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(366)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(367)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(367)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(368)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(368)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(369)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(369)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(370)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(370)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(371)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(371)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(372)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(372)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(373)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(373)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(374)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(374)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(375)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(375)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(376)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(376)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(377)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(377)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(378)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(378)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(379)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(379)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(380)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(380)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(381)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(381)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(382)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(382)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(383)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(383)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(384)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(384)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(385)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(385)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(386)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(386)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(387)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(387)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(388)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(388)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(389)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(389)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(390)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(390)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(391)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(391)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(392)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(392)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(393)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(393)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(394)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(394)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(395)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(395)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(396)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(396)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(397)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(397)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(398)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(398)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(399)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(399)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(400)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(400)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(401)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(401)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(402)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(402)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(403)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(403)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(404)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(404)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(405)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(405)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(406)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(406)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(407)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(407)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(408)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(408)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(409)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(409)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(410)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(410)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(411)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(411)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(412)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(412)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(413)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(413)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(414)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(414)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(415)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(415)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(416)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(416)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(417)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(417)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(418)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(418)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(419)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(419)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(420)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(420)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(421)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(421)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(422)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(422)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(423)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(423)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(424)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(424)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(425)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(425)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(426)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(426)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(427)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(427)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(428)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(428)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(429)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(429)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(430)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(430)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(431)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(431)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(432)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(432)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(433)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(433)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(434)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(434)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(435)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(435)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(436)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(436)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(437)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(437)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(438)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(438)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(439)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(439)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(440)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(440)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(441)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(441)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(442)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(442)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(443)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(443)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(444)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(444)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(445)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(445)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(446)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(446)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(447)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(447)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(448)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(448)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(449)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(449)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(450)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(450)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(451)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(451)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(452)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(452)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(453)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(453)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(454)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(454)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(455)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(455)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(456)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(456)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(457)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(457)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(458)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(458)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(459)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(459)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(460)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(460)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(461)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(461)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(462)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(462)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(463)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(463)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(464)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(464)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(465)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(465)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(466)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(466)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(467)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(467)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(468)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(468)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(469)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(469)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(470)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(470)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(471)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(471)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(472)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(472)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(473)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(473)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(474)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(474)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(475)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(475)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(476)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(476)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(477)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(477)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(478)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(478)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(479)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(479)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(480)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(480)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(481)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(481)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(482)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(482)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(483)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(483)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(484)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(484)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(485)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(485)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(486)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(486)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(487)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(487)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(488)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(488)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(489)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(489)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(490)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(490)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(491)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(491)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(492)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(492)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(493)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(493)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(494)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(494)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(495)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(495)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(496)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(496)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(497)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(497)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(498)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(498)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(499)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(499)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(500)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(500)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(501)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(501)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(502)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(502)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(503)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(503)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(504)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(504)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(505)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(505)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(506)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(506)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(507)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(507)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(508)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(508)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(509)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(509)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(510)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(510)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(511)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(511)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(512)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(512)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(513)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(513)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(514)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(514)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(515)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(515)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(516)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(516)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(517)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(517)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(518)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(518)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(519)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(519)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(520)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(520)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(521)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(521)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(522)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(522)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(523)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(523)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(524)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(524)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(525)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(525)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(526)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(526)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(527)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(527)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(528)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(528)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(529)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(529)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(530)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(530)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(531)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(531)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(532)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(532)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(533)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(533)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(534)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(534)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(535)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(535)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(536)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(536)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(537)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(537)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(538)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(538)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(539)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(539)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(540)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(540)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(541)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(541)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(542)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(542)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(543)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(543)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(544)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(544)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(545)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(545)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(546)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(546)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(547)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(547)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(548)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(548)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(549)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(549)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(550)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(550)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(551)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(551)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(552)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(552)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(553)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(553)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(554)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(554)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(555)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(555)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(556)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(556)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(557)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(557)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(558)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(558)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(559)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(559)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(560)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(560)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(561)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(561)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(562)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(562)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(563)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(563)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(564)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(564)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(565)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(565)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(566)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(566)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(567)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(567)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(568)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(568)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(569)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(569)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(570)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(570)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(571)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(571)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(572)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(572)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(573)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(573)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(574)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(574)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(575)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(575)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(576)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(576)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(577)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(577)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(578)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(578)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(579)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(579)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(580)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(580)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(581)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(581)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(582)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(582)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(583)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(583)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(584)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(584)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(585)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(585)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(586)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(586)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(587)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(587)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(588)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(588)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(589)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(589)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(590)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(590)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(591)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(591)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(592)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(592)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(593)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(593)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(594)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(594)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(595)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(595)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(596)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(596)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(597)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(597)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(598)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(598)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(599)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(599)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(600)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(600)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(601)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(601)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(602)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(602)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(603)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(603)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(604)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(604)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(605)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(605)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(606)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(606)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(607)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(607)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(608)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(608)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(609)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(609)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(610)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(610)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(611)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(611)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(612)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(612)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(613)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(613)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(614)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(614)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(615)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(615)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(616)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(616)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(617)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(617)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(618)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(618)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(619)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(619)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(620)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(620)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(621)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(621)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(622)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(622)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(623)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(623)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(624)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(624)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(625)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(625)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(626)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(626)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(627)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(627)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(628)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(628)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(629)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(629)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(630)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(630)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(631)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(631)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(632)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(632)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(633)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(633)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(634)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(634)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(635)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(635)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(636)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(636)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(637)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(637)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(638)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(638)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(639)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(639)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(640)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(640)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(641)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(641)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(642)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(642)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(643)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(643)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(644)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(644)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(645)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(645)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(646)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(646)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(647)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(647)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(648)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(648)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(649)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(649)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(650)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(650)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(651)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(651)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(652)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(652)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(653)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(653)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(654)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(654)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(655)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(655)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(656)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(656)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(657)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(657)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(658)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(658)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(659)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(659)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(660)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(660)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(661)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(661)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(662)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(662)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(663)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(663)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(664)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(664)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(665)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(665)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(666)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(666)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(667)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(667)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(668)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(668)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(669)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(669)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(670)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(670)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(671)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(671)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(672)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(672)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(673)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(673)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(674)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(674)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(675)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(675)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(676)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(676)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(677)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(677)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(678)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(678)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(679)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(679)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(680)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(680)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(681)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(681)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(682)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(682)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(683)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(683)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(684)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(684)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(685)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(685)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(686)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(686)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(687)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(687)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(688)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(688)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(689)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(689)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(690)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(690)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(691)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(691)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(692)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(692)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(693)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(693)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(694)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(694)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(695)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(695)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(696)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(696)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(697)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(697)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(698)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(698)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(699)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(699)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(700)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(700)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(701)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(701)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(702)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(702)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(703)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(703)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(704)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(704)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(705)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(705)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(706)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(706)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(707)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(707)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(708)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(708)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(709)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(709)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(710)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(710)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(711)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(711)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(712)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(712)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(713)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(713)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(714)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(714)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(715)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(715)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(716)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(716)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(717)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(717)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(718)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(718)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(719)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(719)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(720)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(720)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(721)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(721)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(722)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(722)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(723)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(723)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(724)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(724)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(725)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(725)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(726)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(726)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(727)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(727)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(728)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(728)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(729)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(729)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(730)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(730)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(731)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(731)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(732)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(732)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(733)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(733)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(734)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(734)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(735)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(735)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(736)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(736)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(737)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(737)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(738)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(738)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(739)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(739)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(740)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(740)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(741)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(741)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(742)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(742)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(743)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(743)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(744)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(744)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(745)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(745)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(746)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(746)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(747)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(747)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(748)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(748)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(749)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(749)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(750)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(750)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(751)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(751)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(752)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(752)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(753)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(753)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(754)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(754)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(755)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(755)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(756)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(756)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(757)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(757)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(758)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(758)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(759)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(759)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(760)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(760)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(761)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(761)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(762)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(762)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(763)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(763)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(764)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(764)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(765)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(765)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(766)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(766)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(767)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(767)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(768)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(768)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(769)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(769)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(770)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(770)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(771)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(771)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(772)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(772)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(773)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(773)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(774)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(774)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(775)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(775)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(776)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(776)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(777)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(777)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(778)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(778)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(779)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(779)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(780)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(780)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(781)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(781)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(782)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(782)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(783)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(783)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(784)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(784)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(785)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(785)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(786)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(786)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(787)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(787)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(788)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(788)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(789)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(789)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(790)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(790)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(791)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(791)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(792)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(792)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(793)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(793)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(794)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(794)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(795)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(795)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(796)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(796)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(797)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(797)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(798)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(798)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(799)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(799)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(800)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(800)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(801)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(801)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(802)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(802)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(803)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(803)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(804)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(804)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(805)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(805)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(806)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(806)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(807)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(807)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(808)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(808)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(809)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(809)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(810)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(810)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(811)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(811)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(812)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(812)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(813)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(813)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(814)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(814)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(815)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(815)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(816)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(816)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(817)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(817)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(818)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(818)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(819)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(819)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(820)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(820)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(821)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(821)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(822)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(822)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(823)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(823)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(824)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(824)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(825)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(825)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(826)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(826)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(827)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(827)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(828)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(828)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(829)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(829)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(830)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(830)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(831)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(831)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(832)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(832)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(833)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(833)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(834)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(834)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(835)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(835)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(836)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(836)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(837)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(837)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(838)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(838)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(839)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(839)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(840)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(840)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(841)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(841)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(842)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(842)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(843)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(843)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(844)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(844)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(845)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(845)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(846)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(846)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(847)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(847)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(848)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(848)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(849)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(849)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(850)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(850)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(851)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(851)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(852)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(852)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(853)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(853)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(854)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(854)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(855)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(855)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(856)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(856)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(857)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(857)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(858)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(858)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(859)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(859)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(860)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(860)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(861)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(861)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(862)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(862)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(863)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(863)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(864)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(864)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(865)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(865)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(866)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(866)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(867)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(867)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(868)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(868)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(869)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(869)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(870)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(870)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(871)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(871)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(872)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(872)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(873)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(873)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(874)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(874)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(875)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(875)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(876)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(876)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(877)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(877)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(878)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(878)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(879)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(879)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(880)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(880)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(881)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(881)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(882)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(882)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(883)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(883)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(884)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(884)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(885)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(885)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(886)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(886)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(887)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(887)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(888)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(888)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(889)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(889)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(890)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(890)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(891)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(891)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(892)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(892)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(893)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(893)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(894)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(894)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(895)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(895)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(896)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(896)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(897)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(897)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(898)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(898)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(899)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(899)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(900)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(900)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(901)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(901)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(902)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(902)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(903)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(903)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(904)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(904)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(905)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(905)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(906)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(906)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(907)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(907)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(908)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(908)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(909)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(909)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(910)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(910)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(911)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(911)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(912)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(912)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(913)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(913)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(914)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(914)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(915)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(915)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(916)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(916)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(917)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(917)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(918)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(918)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(919)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(919)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(920)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(920)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(921)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(921)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(922)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(922)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(923)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(923)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(924)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(924)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(925)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(925)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(926)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(926)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(927)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(927)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(928)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(928)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(929)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(929)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(930)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(930)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(931)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(931)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(932)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(932)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(933)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(933)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(934)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(934)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(935)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(935)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(936)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(936)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(937)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(937)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(938)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(938)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(939)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(939)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(940)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(940)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(941)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(941)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(942)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(942)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(943)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(943)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(944)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(944)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(945)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(945)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(946)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(946)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(947)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(947)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(948)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(948)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(949)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(949)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(950)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(950)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(951)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(951)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(952)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(952)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(953)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(953)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(954)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(954)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(955)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(955)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(956)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(956)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(957)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(957)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(958)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(958)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(959)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(959)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(960)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(960)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(961)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(961)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(962)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(962)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(963)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(963)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(964)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(964)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(965)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(965)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(966)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(966)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(967)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(967)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(968)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(968)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(969)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(969)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(970)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(970)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(971)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(971)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(972)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(972)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(973)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(973)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(974)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(974)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(975)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(975)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(976)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(976)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(977)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(977)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(978)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(978)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(979)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(979)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(980)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(980)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(981)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(981)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(982)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(982)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(983)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(983)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(984)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(984)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(985)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(985)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(986)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(986)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(987)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(987)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(988)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(988)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(989)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(989)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(990)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(990)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(991)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(991)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(992)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(992)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(993)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(993)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(994)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(994)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(995)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(995)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(996)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(996)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(997)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(997)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(998)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(998)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Array(999)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Array(999)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Length") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Length" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Reset") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Reset" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "nfa_dfa.Control.Valid") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected nfa_dfa.Control.Valid" severity Failure;
            fieldno := fieldno + 1;

            RESET <= '1';
            ENABLE <= '0';
            wait for 5 NS;
            RESET <= '0';
            ENABLE <= '1';

            -- Read a line each clock
            while not ENDFILE(F) loop
                READLINE(F, L);
                fieldno := 0;
                newfailures := 0;

                -- Write all driver signals out on the clock edge,
                -- except on the first round, where we make sure the reset
                -- values are propagated _before_ the initial clock edge
                if not first_round then
                    wait until rising_edge(CLOCK);
                end if;

                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    nfa_dfa_Traversal_Valid <= 'U';
                else
                    nfa_dfa_Traversal_Valid <= to_std_logic(truncate(tmp));
                end if;
                fieldno := fieldno + 1;

                if first_round then
                    first_round := false;
                else
                    -- Wait until the signals are settled before veriying the results
                    wait until falling_edge(CLOCK);
                end if;

                -- Compare each signal with the value in the CSV file
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(0)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(0) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(0)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(1)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(1) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(1)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(2)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(2) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(2)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(3)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(3) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(3)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(4)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(4) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(4)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(5)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(5) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(5)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(6)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(6) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(6)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(7)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(7) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(7)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(8)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(8) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(8)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(9)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(9) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(9)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(10)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(10) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(10)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(11)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(11) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(11)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(12)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(12) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(12)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(13)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(13) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(13)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(14)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(14) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(14)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(15)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(15) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(15)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(16)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(16) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(16)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(17)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(17) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(17)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(18)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(18) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(18)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(19)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(19) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(19)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(20)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(20) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(20)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(21)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(21) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(21)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(22)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(22) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(22)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(23)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(23) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(23)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(24)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(24) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(24)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(25)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(25) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(25)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(26)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(26) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(26)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(27)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(27) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(27)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(28)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(28) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(28)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(29)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(29) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(29)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(30)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(30) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(30)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(31)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(31) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(31)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(32)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(32) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(32)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(33)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(33) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(33)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(34)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(34) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(34)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(35)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(35) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(35)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(36)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(36) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(36)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(37)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(37) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(37)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(38)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(38) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(38)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(39)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(39) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(39)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(40)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(40) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(40)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(41)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(41) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(41)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(42)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(42) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(42)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(43)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(43) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(43)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(44)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(44) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(44)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(45)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(45) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(45)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(46)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(46) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(46)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(47)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(47) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(47)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(48)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(48) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(48)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(49)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(49) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(49)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(50)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(50) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(50)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(51)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(51) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(51)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(52)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(52) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(52)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(53)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(53) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(53)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(54)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(54) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(54)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(55)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(55) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(55)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(56)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(56) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(56)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(57)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(57) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(57)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(58)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(58) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(58)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(59)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(59) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(59)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(60)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(60) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(60)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(61)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(61) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(61)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(62)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(62) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(62)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(63)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(63) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(63)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(64)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(64) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(64)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(65)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(65) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(65)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(66)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(66) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(66)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(67)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(67) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(67)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(68)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(68) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(68)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(69)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(69) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(69)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(70)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(70) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(70)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(71)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(71) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(71)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(72)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(72) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(72)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(73)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(73) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(73)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(74)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(74) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(74)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(75)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(75) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(75)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(76)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(76) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(76)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(77)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(77) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(77)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(78)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(78) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(78)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(79)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(79) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(79)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(80)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(80) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(80)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(81)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(81) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(81)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(82)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(82) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(82)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(83)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(83) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(83)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(84)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(84) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(84)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(85)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(85) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(85)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(86)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(86) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(86)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(87)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(87) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(87)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(88)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(88) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(88)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(89)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(89) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(89)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(90)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(90) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(90)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(91)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(91) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(91)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(92)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(92) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(92)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(93)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(93) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(93)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(94)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(94) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(94)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(95)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(95) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(95)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(96)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(96) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(96)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(97)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(97) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(97)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(98)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(98) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(98)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(99)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(99) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(99)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(100)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(100) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(100)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(101)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(101) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(101)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(102)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(102) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(102)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(103)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(103) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(103)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(104)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(104) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(104)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(105)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(105) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(105)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(106)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(106) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(106)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(107)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(107) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(107)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(108)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(108) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(108)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(109)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(109) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(109)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(110)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(110) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(110)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(111)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(111) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(111)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(112)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(112) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(112)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(113)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(113) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(113)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(114)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(114) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(114)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(115)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(115) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(115)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(116)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(116) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(116)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(117)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(117) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(117)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(118)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(118) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(118)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(119)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(119) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(119)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(120)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(120) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(120)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(121)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(121) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(121)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(122)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(122) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(122)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(123)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(123) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(123)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(124)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(124) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(124)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(125)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(125) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(125)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(126)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(126) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(126)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(127)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(127) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(127)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(128)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(128) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(128)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(129)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(129) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(129)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(130)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(130) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(130)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(131)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(131) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(131)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(132)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(132) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(132)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(133)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(133) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(133)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(134)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(134) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(134)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(135)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(135) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(135)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(136)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(136) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(136)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(137)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(137) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(137)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(138)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(138) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(138)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(139)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(139) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(139)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(140)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(140) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(140)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(141)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(141) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(141)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(142)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(142) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(142)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(143)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(143) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(143)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(144)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(144) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(144)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(145)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(145) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(145)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(146)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(146) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(146)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(147)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(147) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(147)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(148)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(148) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(148)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(149)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(149) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(149)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(150)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(150) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(150)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(151)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(151) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(151)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(152)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(152) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(152)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(153)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(153) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(153)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(154)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(154) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(154)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(155)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(155) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(155)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(156)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(156) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(156)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(157)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(157) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(157)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(158)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(158) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(158)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(159)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(159) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(159)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(160)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(160) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(160)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(161)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(161) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(161)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(162)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(162) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(162)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(163)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(163) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(163)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(164)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(164) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(164)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(165)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(165) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(165)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(166)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(166) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(166)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(167)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(167) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(167)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(168)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(168) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(168)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(169)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(169) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(169)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(170)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(170) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(170)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(171)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(171) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(171)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(172)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(172) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(172)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(173)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(173) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(173)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(174)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(174) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(174)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(175)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(175) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(175)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(176)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(176) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(176)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(177)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(177) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(177)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(178)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(178) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(178)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(179)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(179) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(179)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(180)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(180) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(180)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(181)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(181) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(181)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(182)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(182) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(182)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(183)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(183) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(183)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(184)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(184) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(184)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(185)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(185) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(185)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(186)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(186) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(186)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(187)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(187) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(187)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(188)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(188) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(188)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(189)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(189) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(189)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(190)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(190) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(190)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(191)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(191) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(191)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(192)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(192) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(192)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(193)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(193) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(193)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(194)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(194) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(194)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(195)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(195) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(195)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(196)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(196) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(196)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(197)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(197) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(197)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(198)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(198) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(198)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(199)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(199) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(199)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(200)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(200) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(200)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(201)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(201) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(201)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(202)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(202) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(202)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(203)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(203) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(203)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(204)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(204) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(204)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(205)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(205) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(205)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(206)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(206) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(206)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(207)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(207) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(207)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(208)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(208) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(208)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(209)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(209) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(209)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(210)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(210) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(210)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(211)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(211) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(211)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(212)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(212) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(212)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(213)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(213) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(213)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(214)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(214) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(214)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(215)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(215) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(215)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(216)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(216) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(216)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(217)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(217) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(217)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(218)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(218) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(218)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(219)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(219) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(219)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(220)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(220) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(220)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(221)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(221) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(221)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(222)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(222) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(222)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(223)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(223) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(223)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(224)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(224) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(224)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(225)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(225) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(225)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(226)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(226) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(226)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(227)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(227) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(227)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(228)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(228) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(228)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(229)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(229) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(229)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(230)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(230) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(230)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(231)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(231) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(231)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(232)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(232) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(232)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(233)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(233) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(233)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(234)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(234) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(234)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(235)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(235) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(235)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(236)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(236) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(236)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(237)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(237) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(237)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(238)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(238) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(238)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(239)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(239) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(239)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(240)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(240) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(240)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(241)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(241) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(241)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(242)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(242) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(242)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(243)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(243) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(243)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(244)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(244) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(244)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(245)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(245) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(245)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(246)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(246) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(246)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(247)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(247) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(247)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(248)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(248) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(248)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(249)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(249) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(249)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(250)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(250) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(250)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(251)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(251) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(251)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(252)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(252) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(252)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(253)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(253) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(253)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(254)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(254) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(254)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(255)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(255) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(255)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(256)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(256) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(256)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(257)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(257) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(257)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(258)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(258) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(258)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(259)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(259) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(259)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(260)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(260) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(260)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(261)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(261) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(261)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(262)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(262) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(262)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(263)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(263) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(263)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(264)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(264) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(264)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(265)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(265) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(265)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(266)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(266) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(266)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(267)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(267) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(267)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(268)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(268) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(268)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(269)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(269) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(269)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(270)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(270) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(270)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(271)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(271) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(271)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(272)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(272) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(272)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(273)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(273) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(273)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(274)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(274) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(274)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(275)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(275) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(275)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(276)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(276) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(276)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(277)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(277) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(277)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(278)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(278) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(278)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(279)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(279) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(279)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(280)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(280) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(280)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(281)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(281) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(281)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(282)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(282) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(282)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(283)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(283) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(283)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(284)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(284) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(284)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(285)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(285) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(285)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(286)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(286) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(286)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(287)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(287) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(287)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(288)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(288) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(288)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(289)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(289) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(289)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(290)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(290) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(290)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(291)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(291) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(291)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(292)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(292) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(292)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(293)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(293) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(293)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(294)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(294) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(294)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(295)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(295) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(295)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(296)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(296) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(296)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(297)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(297) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(297)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(298)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(298) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(298)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(299)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(299) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(299)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(300)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(300) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(300)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(301)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(301) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(301)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(302)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(302) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(302)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(303)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(303) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(303)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(304)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(304) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(304)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(305)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(305) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(305)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(306)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(306) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(306)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(307)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(307) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(307)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(308)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(308) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(308)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(309)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(309) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(309)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(310)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(310) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(310)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(311)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(311) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(311)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(312)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(312) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(312)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(313)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(313) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(313)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(314)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(314) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(314)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(315)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(315) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(315)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(316)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(316) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(316)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(317)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(317) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(317)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(318)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(318) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(318)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(319)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(319) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(319)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(320)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(320) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(320)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(321)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(321) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(321)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(322)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(322) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(322)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(323)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(323) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(323)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(324)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(324) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(324)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(325)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(325) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(325)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(326)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(326) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(326)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(327)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(327) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(327)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(328)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(328) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(328)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(329)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(329) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(329)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(330)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(330) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(330)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(331)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(331) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(331)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(332)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(332) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(332)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(333)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(333) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(333)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(334)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(334) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(334)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(335)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(335) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(335)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(336)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(336) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(336)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(337)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(337) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(337)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(338)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(338) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(338)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(339)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(339) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(339)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(340)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(340) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(340)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(341)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(341) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(341)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(342)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(342) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(342)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(343)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(343) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(343)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(344)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(344) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(344)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(345)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(345) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(345)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(346)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(346) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(346)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(347)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(347) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(347)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(348)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(348) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(348)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(349)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(349) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(349)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(350)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(350) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(350)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(351)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(351) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(351)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(352)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(352) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(352)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(353)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(353) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(353)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(354)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(354) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(354)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(355)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(355) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(355)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(356)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(356) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(356)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(357)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(357) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(357)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(358)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(358) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(358)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(359)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(359) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(359)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(360)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(360) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(360)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(361)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(361) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(361)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(362)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(362) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(362)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(363)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(363) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(363)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(364)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(364) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(364)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(365)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(365) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(365)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(366)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(366) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(366)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(367)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(367) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(367)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(368)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(368) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(368)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(369)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(369) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(369)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(370)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(370) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(370)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(371)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(371) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(371)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(372)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(372) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(372)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(373)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(373) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(373)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(374)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(374) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(374)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(375)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(375) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(375)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(376)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(376) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(376)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(377)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(377) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(377)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(378)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(378) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(378)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(379)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(379) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(379)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(380)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(380) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(380)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(381)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(381) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(381)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(382)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(382) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(382)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(383)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(383) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(383)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(384)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(384) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(384)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(385)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(385) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(385)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(386)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(386) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(386)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(387)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(387) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(387)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(388)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(388) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(388)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(389)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(389) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(389)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(390)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(390) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(390)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(391)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(391) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(391)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(392)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(392) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(392)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(393)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(393) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(393)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(394)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(394) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(394)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(395)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(395) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(395)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(396)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(396) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(396)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(397)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(397) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(397)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(398)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(398) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(398)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(399)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(399) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(399)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(400)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(400) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(400)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(401)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(401) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(401)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(402)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(402) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(402)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(403)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(403) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(403)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(404)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(404) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(404)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(405)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(405) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(405)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(406)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(406) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(406)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(407)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(407) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(407)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(408)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(408) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(408)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(409)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(409) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(409)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(410)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(410) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(410)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(411)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(411) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(411)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(412)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(412) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(412)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(413)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(413) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(413)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(414)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(414) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(414)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(415)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(415) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(415)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(416)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(416) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(416)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(417)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(417) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(417)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(418)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(418) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(418)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(419)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(419) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(419)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(420)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(420) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(420)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(421)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(421) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(421)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(422)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(422) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(422)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(423)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(423) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(423)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(424)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(424) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(424)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(425)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(425) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(425)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(426)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(426) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(426)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(427)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(427) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(427)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(428)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(428) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(428)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(429)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(429) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(429)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(430)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(430) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(430)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(431)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(431) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(431)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(432)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(432) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(432)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(433)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(433) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(433)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(434)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(434) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(434)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(435)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(435) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(435)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(436)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(436) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(436)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(437)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(437) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(437)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(438)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(438) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(438)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(439)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(439) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(439)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(440)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(440) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(440)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(441)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(441) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(441)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(442)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(442) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(442)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(443)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(443) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(443)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(444)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(444) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(444)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(445)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(445) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(445)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(446)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(446) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(446)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(447)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(447) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(447)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(448)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(448) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(448)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(449)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(449) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(449)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(450)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(450) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(450)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(451)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(451) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(451)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(452)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(452) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(452)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(453)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(453) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(453)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(454)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(454) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(454)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(455)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(455) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(455)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(456)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(456) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(456)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(457)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(457) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(457)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(458)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(458) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(458)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(459)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(459) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(459)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(460)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(460) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(460)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(461)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(461) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(461)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(462)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(462) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(462)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(463)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(463) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(463)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(464)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(464) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(464)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(465)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(465) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(465)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(466)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(466) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(466)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(467)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(467) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(467)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(468)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(468) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(468)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(469)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(469) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(469)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(470)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(470) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(470)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(471)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(471) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(471)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(472)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(472) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(472)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(473)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(473) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(473)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(474)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(474) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(474)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(475)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(475) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(475)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(476)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(476) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(476)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(477)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(477) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(477)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(478)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(478) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(478)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(479)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(479) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(479)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(480)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(480) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(480)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(481)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(481) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(481)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(482)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(482) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(482)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(483)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(483) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(483)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(484)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(484) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(484)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(485)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(485) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(485)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(486)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(486) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(486)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(487)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(487) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(487)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(488)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(488) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(488)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(489)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(489) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(489)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(490)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(490) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(490)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(491)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(491) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(491)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(492)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(492) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(492)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(493)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(493) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(493)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(494)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(494) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(494)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(495)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(495) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(495)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(496)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(496) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(496)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(497)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(497) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(497)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(498)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(498) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(498)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(499)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(499) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(499)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(500)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(500) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(500)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(501)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(501) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(501)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(502)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(502) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(502)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(503)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(503) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(503)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(504)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(504) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(504)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(505)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(505) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(505)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(506)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(506) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(506)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(507)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(507) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(507)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(508)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(508) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(508)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(509)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(509) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(509)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(510)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(510) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(510)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(511)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(511) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(511)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(512)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(512) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(512)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(513)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(513) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(513)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(514)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(514) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(514)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(515)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(515) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(515)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(516)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(516) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(516)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(517)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(517) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(517)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(518)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(518) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(518)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(519)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(519) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(519)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(520)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(520) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(520)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(521)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(521) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(521)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(522)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(522) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(522)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(523)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(523) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(523)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(524)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(524) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(524)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(525)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(525) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(525)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(526)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(526) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(526)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(527)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(527) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(527)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(528)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(528) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(528)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(529)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(529) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(529)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(530)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(530) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(530)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(531)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(531) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(531)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(532)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(532) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(532)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(533)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(533) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(533)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(534)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(534) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(534)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(535)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(535) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(535)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(536)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(536) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(536)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(537)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(537) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(537)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(538)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(538) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(538)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(539)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(539) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(539)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(540)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(540) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(540)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(541)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(541) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(541)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(542)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(542) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(542)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(543)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(543) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(543)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(544)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(544) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(544)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(545)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(545) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(545)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(546)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(546) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(546)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(547)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(547) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(547)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(548)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(548) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(548)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(549)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(549) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(549)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(550)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(550) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(550)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(551)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(551) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(551)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(552)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(552) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(552)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(553)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(553) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(553)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(554)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(554) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(554)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(555)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(555) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(555)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(556)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(556) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(556)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(557)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(557) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(557)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(558)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(558) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(558)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(559)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(559) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(559)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(560)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(560) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(560)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(561)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(561) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(561)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(562)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(562) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(562)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(563)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(563) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(563)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(564)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(564) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(564)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(565)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(565) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(565)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(566)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(566) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(566)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(567)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(567) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(567)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(568)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(568) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(568)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(569)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(569) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(569)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(570)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(570) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(570)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(571)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(571) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(571)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(572)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(572) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(572)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(573)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(573) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(573)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(574)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(574) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(574)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(575)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(575) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(575)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(576)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(576) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(576)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(577)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(577) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(577)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(578)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(578) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(578)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(579)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(579) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(579)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(580)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(580) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(580)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(581)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(581) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(581)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(582)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(582) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(582)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(583)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(583) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(583)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(584)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(584) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(584)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(585)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(585) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(585)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(586)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(586) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(586)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(587)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(587) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(587)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(588)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(588) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(588)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(589)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(589) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(589)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(590)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(590) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(590)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(591)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(591) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(591)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(592)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(592) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(592)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(593)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(593) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(593)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(594)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(594) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(594)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(595)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(595) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(595)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(596)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(596) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(596)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(597)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(597) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(597)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(598)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(598) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(598)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(599)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(599) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(599)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(600)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(600) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(600)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(601)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(601) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(601)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(602)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(602) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(602)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(603)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(603) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(603)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(604)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(604) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(604)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(605)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(605) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(605)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(606)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(606) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(606)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(607)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(607) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(607)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(608)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(608) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(608)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(609)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(609) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(609)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(610)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(610) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(610)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(611)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(611) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(611)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(612)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(612) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(612)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(613)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(613) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(613)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(614)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(614) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(614)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(615)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(615) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(615)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(616)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(616) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(616)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(617)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(617) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(617)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(618)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(618) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(618)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(619)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(619) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(619)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(620)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(620) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(620)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(621)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(621) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(621)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(622)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(622) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(622)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(623)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(623) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(623)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(624)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(624) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(624)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(625)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(625) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(625)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(626)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(626) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(626)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(627)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(627) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(627)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(628)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(628) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(628)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(629)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(629) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(629)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(630)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(630) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(630)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(631)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(631) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(631)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(632)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(632) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(632)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(633)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(633) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(633)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(634)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(634) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(634)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(635)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(635) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(635)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(636)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(636) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(636)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(637)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(637) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(637)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(638)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(638) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(638)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(639)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(639) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(639)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(640)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(640) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(640)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(641)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(641) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(641)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(642)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(642) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(642)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(643)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(643) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(643)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(644)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(644) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(644)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(645)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(645) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(645)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(646)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(646) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(646)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(647)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(647) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(647)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(648)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(648) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(648)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(649)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(649) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(649)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(650)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(650) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(650)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(651)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(651) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(651)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(652)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(652) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(652)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(653)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(653) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(653)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(654)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(654) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(654)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(655)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(655) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(655)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(656)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(656) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(656)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(657)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(657) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(657)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(658)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(658) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(658)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(659)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(659) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(659)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(660)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(660) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(660)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(661)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(661) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(661)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(662)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(662) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(662)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(663)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(663) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(663)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(664)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(664) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(664)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(665)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(665) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(665)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(666)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(666) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(666)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(667)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(667) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(667)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(668)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(668) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(668)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(669)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(669) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(669)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(670)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(670) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(670)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(671)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(671) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(671)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(672)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(672) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(672)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(673)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(673) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(673)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(674)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(674) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(674)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(675)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(675) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(675)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(676)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(676) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(676)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(677)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(677) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(677)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(678)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(678) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(678)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(679)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(679) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(679)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(680)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(680) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(680)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(681)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(681) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(681)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(682)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(682) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(682)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(683)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(683) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(683)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(684)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(684) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(684)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(685)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(685) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(685)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(686)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(686) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(686)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(687)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(687) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(687)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(688)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(688) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(688)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(689)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(689) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(689)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(690)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(690) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(690)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(691)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(691) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(691)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(692)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(692) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(692)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(693)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(693) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(693)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(694)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(694) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(694)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(695)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(695) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(695)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(696)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(696) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(696)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(697)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(697) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(697)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(698)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(698) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(698)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(699)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(699) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(699)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(700)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(700) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(700)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(701)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(701) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(701)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(702)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(702) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(702)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(703)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(703) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(703)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(704)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(704) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(704)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(705)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(705) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(705)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(706)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(706) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(706)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(707)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(707) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(707)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(708)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(708) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(708)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(709)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(709) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(709)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(710)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(710) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(710)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(711)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(711) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(711)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(712)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(712) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(712)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(713)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(713) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(713)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(714)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(714) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(714)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(715)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(715) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(715)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(716)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(716) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(716)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(717)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(717) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(717)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(718)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(718) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(718)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(719)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(719) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(719)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(720)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(720) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(720)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(721)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(721) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(721)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(722)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(722) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(722)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(723)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(723) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(723)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(724)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(724) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(724)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(725)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(725) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(725)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(726)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(726) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(726)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(727)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(727) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(727)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(728)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(728) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(728)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(729)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(729) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(729)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(730)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(730) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(730)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(731)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(731) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(731)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(732)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(732) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(732)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(733)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(733) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(733)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(734)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(734) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(734)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(735)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(735) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(735)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(736)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(736) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(736)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(737)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(737) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(737)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(738)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(738) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(738)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(739)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(739) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(739)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(740)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(740) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(740)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(741)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(741) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(741)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(742)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(742) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(742)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(743)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(743) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(743)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(744)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(744) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(744)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(745)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(745) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(745)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(746)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(746) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(746)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(747)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(747) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(747)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(748)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(748) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(748)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(749)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(749) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(749)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(750)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(750) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(750)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(751)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(751) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(751)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(752)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(752) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(752)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(753)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(753) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(753)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(754)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(754) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(754)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(755)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(755) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(755)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(756)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(756) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(756)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(757)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(757) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(757)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(758)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(758) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(758)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(759)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(759) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(759)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(760)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(760) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(760)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(761)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(761) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(761)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(762)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(762) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(762)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(763)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(763) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(763)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(764)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(764) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(764)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(765)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(765) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(765)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(766)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(766) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(766)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(767)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(767) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(767)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(768)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(768) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(768)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(769)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(769) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(769)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(770)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(770) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(770)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(771)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(771) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(771)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(772)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(772) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(772)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(773)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(773) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(773)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(774)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(774) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(774)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(775)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(775) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(775)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(776)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(776) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(776)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(777)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(777) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(777)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(778)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(778) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(778)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(779)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(779) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(779)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(780)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(780) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(780)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(781)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(781) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(781)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(782)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(782) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(782)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(783)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(783) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(783)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(784)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(784) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(784)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(785)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(785) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(785)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(786)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(786) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(786)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(787)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(787) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(787)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(788)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(788) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(788)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(789)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(789) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(789)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(790)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(790) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(790)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(791)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(791) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(791)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(792)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(792) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(792)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(793)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(793) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(793)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(794)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(794) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(794)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(795)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(795) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(795)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(796)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(796) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(796)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(797)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(797) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(797)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(798)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(798) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(798)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(799)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(799) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(799)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(800)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(800) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(800)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(801)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(801) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(801)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(802)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(802) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(802)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(803)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(803) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(803)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(804)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(804) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(804)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(805)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(805) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(805)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(806)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(806) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(806)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(807)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(807) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(807)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(808)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(808) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(808)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(809)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(809) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(809)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(810)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(810) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(810)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(811)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(811) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(811)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(812)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(812) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(812)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(813)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(813) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(813)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(814)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(814) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(814)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(815)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(815) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(815)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(816)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(816) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(816)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(817)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(817) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(817)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(818)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(818) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(818)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(819)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(819) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(819)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(820)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(820) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(820)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(821)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(821) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(821)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(822)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(822) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(822)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(823)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(823) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(823)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(824)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(824) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(824)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(825)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(825) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(825)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(826)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(826) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(826)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(827)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(827) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(827)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(828)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(828) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(828)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(829)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(829) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(829)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(830)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(830) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(830)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(831)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(831) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(831)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(832)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(832) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(832)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(833)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(833) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(833)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(834)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(834) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(834)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(835)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(835) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(835)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(836)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(836) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(836)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(837)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(837) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(837)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(838)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(838) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(838)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(839)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(839) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(839)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(840)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(840) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(840)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(841)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(841) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(841)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(842)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(842) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(842)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(843)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(843) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(843)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(844)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(844) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(844)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(845)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(845) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(845)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(846)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(846) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(846)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(847)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(847) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(847)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(848)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(848) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(848)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(849)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(849) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(849)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(850)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(850) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(850)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(851)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(851) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(851)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(852)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(852) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(852)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(853)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(853) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(853)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(854)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(854) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(854)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(855)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(855) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(855)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(856)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(856) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(856)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(857)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(857) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(857)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(858)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(858) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(858)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(859)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(859) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(859)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(860)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(860) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(860)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(861)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(861) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(861)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(862)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(862) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(862)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(863)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(863) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(863)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(864)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(864) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(864)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(865)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(865) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(865)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(866)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(866) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(866)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(867)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(867) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(867)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(868)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(868) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(868)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(869)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(869) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(869)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(870)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(870) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(870)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(871)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(871) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(871)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(872)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(872) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(872)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(873)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(873) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(873)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(874)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(874) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(874)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(875)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(875) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(875)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(876)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(876) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(876)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(877)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(877) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(877)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(878)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(878) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(878)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(879)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(879) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(879)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(880)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(880) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(880)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(881)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(881) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(881)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(882)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(882) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(882)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(883)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(883) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(883)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(884)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(884) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(884)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(885)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(885) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(885)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(886)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(886) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(886)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(887)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(887) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(887)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(888)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(888) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(888)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(889)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(889) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(889)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(890)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(890) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(890)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(891)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(891) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(891)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(892)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(892) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(892)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(893)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(893) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(893)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(894)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(894) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(894)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(895)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(895) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(895)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(896)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(896) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(896)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(897)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(897) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(897)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(898)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(898) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(898)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(899)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(899) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(899)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(900)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(900) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(900)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(901)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(901) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(901)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(902)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(902) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(902)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(903)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(903) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(903)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(904)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(904) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(904)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(905)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(905) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(905)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(906)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(906) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(906)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(907)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(907) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(907)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(908)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(908) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(908)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(909)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(909) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(909)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(910)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(910) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(910)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(911)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(911) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(911)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(912)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(912) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(912)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(913)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(913) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(913)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(914)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(914) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(914)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(915)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(915) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(915)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(916)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(916) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(916)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(917)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(917) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(917)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(918)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(918) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(918)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(919)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(919) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(919)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(920)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(920) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(920)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(921)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(921) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(921)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(922)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(922) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(922)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(923)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(923) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(923)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(924)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(924) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(924)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(925)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(925) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(925)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(926)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(926) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(926)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(927)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(927) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(927)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(928)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(928) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(928)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(929)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(929) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(929)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(930)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(930) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(930)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(931)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(931) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(931)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(932)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(932) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(932)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(933)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(933) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(933)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(934)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(934) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(934)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(935)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(935) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(935)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(936)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(936) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(936)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(937)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(937) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(937)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(938)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(938) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(938)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(939)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(939) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(939)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(940)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(940) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(940)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(941)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(941) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(941)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(942)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(942) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(942)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(943)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(943) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(943)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(944)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(944) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(944)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(945)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(945) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(945)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(946)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(946) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(946)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(947)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(947) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(947)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(948)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(948) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(948)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(949)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(949) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(949)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(950)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(950) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(950)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(951)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(951) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(951)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(952)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(952) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(952)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(953)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(953) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(953)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(954)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(954) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(954)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(955)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(955) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(955)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(956)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(956) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(956)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(957)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(957) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(957)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(958)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(958) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(958)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(959)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(959) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(959)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(960)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(960) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(960)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(961)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(961) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(961)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(962)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(962) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(962)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(963)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(963) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(963)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(964)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(964) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(964)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(965)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(965) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(965)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(966)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(966) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(966)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(967)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(967) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(967)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(968)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(968) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(968)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(969)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(969) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(969)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(970)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(970) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(970)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(971)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(971) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(971)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(972)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(972) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(972)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(973)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(973) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(973)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(974)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(974) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(974)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(975)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(975) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(975)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(976)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(976) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(976)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(977)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(977) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(977)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(978)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(978) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(978)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(979)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(979) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(979)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(980)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(980) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(980)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(981)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(981) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(981)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(982)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(982) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(982)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(983)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(983) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(983)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(984)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(984) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(984)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(985)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(985) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(985)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(986)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(986) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(986)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(987)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(987) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(987)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(988)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(988) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(988)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(989)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(989) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(989)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(990)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(990) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(990)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(991)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(991) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(991)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(992)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(992) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(992)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(993)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(993) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(993)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(994)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(994) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(994)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(995)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(995) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(995)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(996)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(996) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(996)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(997)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(997) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(997)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(998)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(998) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(998)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Array(999)), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Array(999) in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Array(999)) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Length), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Length in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Length) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Reset), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Reset in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Reset) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(nfa_dfa_Control_Valid), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for nfa_dfa_Control_Valid in cycle " & integer'image(clockcycle) & " was: " & str(nfa_dfa_Control_Valid) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;

                failures := failures + newfailures;
                if newfailures = 0 then
                    first_failure_tick := -1;
                elsif first_failure_tick = -1 then
                    first_failure_tick := clockcycle;
                else
                    if clockcycle - first_failure_tick >= 5 then
                        report "Stopping simulation due to five consecutive failed cycles" severity error;
                        StopClock <= true;
                    elsif failures > 20 then
                        report "Stopping simulation after 20 failures" severity error;
                        StopClock <= true;
                    end if;
                end if;

                clockcycle := clockcycle + 1;
            end loop;

            FILE_CLOSE(F);
        end if;

        if failures = 0 then
            report "completed successfully after " & integer'image(clockcycle) & " clockcycles";
        else
            report "completed with " & integer'image(failures) & " error(s) after " & integer'image(clockcycle) & " clockcycle(s)";
        end if;
        StopClock <= true;

        wait;
    end process;
end architecture TestBench;