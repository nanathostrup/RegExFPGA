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

    signal Control_Array : Control_Array_type;
    signal Control_Length : T_SYSTEM_INT32;
    signal Control_Reset : T_SYSTEM_BOOL;
    signal Control_Valid : T_SYSTEM_BOOL;
    signal Traversal_Valid : T_SYSTEM_BOOL;

begin

    uut: entity work.sme_intro
    port map (
        Control_Valid => Control_Valid,
        Control_Reset => Control_Reset,
        Control_Length => Control_Length,
        Control_Array => Control_Array,
        Traversal_Valid => Traversal_Valid,

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
            assert are_strings_equal(tmp, "Control.Array(0)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(0)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(1)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(1)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(2)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(2)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(3)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(3)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(4)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(4)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(5)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(5)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(6)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(6)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(7)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(7)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(8)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(8)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(9)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(9)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(10)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(10)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(11)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(11)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(12)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(12)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(13)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(13)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(14)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(14)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(15)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(15)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(16)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(16)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(17)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(17)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(18)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(18)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(19)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(19)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(20)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(20)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(21)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(21)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(22)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(22)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(23)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(23)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(24)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(24)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(25)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(25)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(26)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(26)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(27)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(27)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(28)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(28)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(29)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(29)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(30)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(30)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(31)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(31)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(32)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(32)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(33)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(33)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(34)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(34)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(35)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(35)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(36)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(36)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(37)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(37)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(38)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(38)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(39)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(39)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(40)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(40)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(41)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(41)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(42)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(42)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(43)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(43)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(44)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(44)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(45)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(45)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(46)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(46)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(47)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(47)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(48)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(48)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(49)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(49)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(50)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(50)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(51)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(51)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(52)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(52)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(53)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(53)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(54)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(54)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(55)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(55)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(56)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(56)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(57)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(57)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(58)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(58)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(59)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(59)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(60)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(60)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(61)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(61)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(62)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(62)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(63)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(63)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(64)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(64)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(65)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(65)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(66)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(66)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(67)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(67)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(68)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(68)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(69)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(69)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(70)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(70)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(71)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(71)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(72)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(72)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(73)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(73)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(74)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(74)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(75)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(75)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(76)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(76)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(77)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(77)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(78)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(78)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(79)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(79)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(80)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(80)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(81)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(81)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(82)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(82)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(83)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(83)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(84)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(84)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(85)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(85)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(86)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(86)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(87)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(87)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(88)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(88)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(89)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(89)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(90)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(90)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(91)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(91)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(92)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(92)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(93)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(93)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(94)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(94)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(95)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(95)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(96)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(96)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(97)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(97)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(98)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(98)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(99)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(99)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(100)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(100)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(101)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(101)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(102)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(102)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(103)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(103)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(104)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(104)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(105)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(105)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(106)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(106)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(107)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(107)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(108)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(108)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(109)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(109)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(110)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(110)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(111)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(111)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(112)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(112)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(113)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(113)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(114)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(114)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(115)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(115)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(116)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(116)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(117)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(117)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(118)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(118)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(119)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(119)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(120)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(120)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(121)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(121)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(122)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(122)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(123)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(123)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(124)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(124)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(125)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(125)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(126)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(126)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(127)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(127)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(128)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(128)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(129)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(129)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(130)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(130)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(131)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(131)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(132)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(132)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(133)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(133)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(134)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(134)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(135)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(135)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(136)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(136)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(137)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(137)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(138)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(138)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(139)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(139)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(140)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(140)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(141)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(141)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(142)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(142)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(143)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(143)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(144)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(144)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(145)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(145)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(146)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(146)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(147)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(147)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(148)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(148)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(149)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(149)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(150)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(150)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(151)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(151)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(152)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(152)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(153)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(153)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(154)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(154)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(155)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(155)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(156)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(156)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(157)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(157)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(158)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(158)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(159)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(159)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(160)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(160)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(161)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(161)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(162)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(162)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(163)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(163)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(164)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(164)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(165)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(165)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(166)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(166)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(167)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(167)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(168)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(168)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(169)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(169)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(170)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(170)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(171)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(171)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(172)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(172)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(173)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(173)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(174)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(174)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(175)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(175)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(176)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(176)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(177)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(177)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(178)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(178)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(179)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(179)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(180)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(180)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(181)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(181)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(182)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(182)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(183)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(183)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(184)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(184)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(185)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(185)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(186)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(186)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(187)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(187)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(188)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(188)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(189)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(189)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(190)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(190)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(191)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(191)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(192)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(192)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(193)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(193)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(194)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(194)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(195)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(195)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(196)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(196)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(197)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(197)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(198)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(198)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(199)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(199)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(200)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(200)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(201)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(201)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(202)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(202)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(203)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(203)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(204)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(204)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(205)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(205)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(206)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(206)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(207)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(207)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(208)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(208)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(209)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(209)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(210)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(210)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(211)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(211)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(212)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(212)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(213)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(213)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(214)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(214)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(215)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(215)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(216)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(216)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(217)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(217)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(218)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(218)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(219)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(219)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(220)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(220)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(221)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(221)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(222)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(222)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(223)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(223)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(224)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(224)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(225)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(225)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(226)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(226)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(227)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(227)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(228)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(228)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(229)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(229)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(230)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(230)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(231)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(231)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(232)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(232)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(233)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(233)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(234)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(234)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(235)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(235)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(236)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(236)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(237)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(237)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(238)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(238)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(239)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(239)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(240)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(240)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(241)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(241)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(242)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(242)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(243)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(243)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(244)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(244)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(245)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(245)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(246)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(246)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(247)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(247)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(248)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(248)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(249)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(249)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(250)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(250)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(251)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(251)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(252)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(252)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(253)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(253)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(254)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(254)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(255)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(255)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(256)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(256)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(257)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(257)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(258)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(258)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(259)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(259)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(260)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(260)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(261)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(261)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(262)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(262)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(263)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(263)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(264)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(264)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(265)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(265)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(266)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(266)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(267)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(267)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(268)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(268)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(269)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(269)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(270)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(270)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(271)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(271)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(272)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(272)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(273)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(273)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(274)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(274)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(275)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(275)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(276)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(276)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(277)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(277)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(278)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(278)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(279)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(279)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(280)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(280)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(281)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(281)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(282)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(282)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(283)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(283)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(284)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(284)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(285)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(285)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(286)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(286)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(287)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(287)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(288)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(288)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(289)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(289)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(290)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(290)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(291)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(291)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(292)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(292)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(293)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(293)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(294)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(294)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(295)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(295)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(296)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(296)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(297)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(297)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(298)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(298)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(299)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(299)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(300)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(300)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(301)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(301)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(302)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(302)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(303)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(303)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(304)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(304)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(305)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(305)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(306)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(306)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(307)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(307)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(308)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(308)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(309)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(309)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(310)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(310)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(311)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(311)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(312)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(312)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(313)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(313)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(314)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(314)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(315)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(315)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(316)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(316)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(317)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(317)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(318)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(318)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(319)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(319)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(320)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(320)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(321)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(321)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(322)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(322)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(323)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(323)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(324)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(324)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(325)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(325)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(326)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(326)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(327)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(327)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(328)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(328)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(329)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(329)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(330)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(330)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(331)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(331)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(332)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(332)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(333)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(333)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(334)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(334)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(335)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(335)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(336)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(336)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(337)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(337)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(338)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(338)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(339)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(339)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(340)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(340)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(341)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(341)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(342)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(342)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(343)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(343)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(344)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(344)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(345)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(345)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(346)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(346)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(347)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(347)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(348)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(348)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(349)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(349)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(350)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(350)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(351)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(351)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(352)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(352)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(353)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(353)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(354)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(354)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(355)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(355)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(356)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(356)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(357)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(357)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(358)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(358)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(359)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(359)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(360)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(360)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(361)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(361)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(362)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(362)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(363)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(363)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(364)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(364)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(365)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(365)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(366)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(366)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(367)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(367)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(368)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(368)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(369)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(369)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(370)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(370)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(371)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(371)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(372)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(372)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(373)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(373)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(374)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(374)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(375)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(375)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(376)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(376)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(377)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(377)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(378)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(378)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(379)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(379)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(380)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(380)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(381)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(381)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(382)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(382)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(383)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(383)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(384)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(384)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(385)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(385)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(386)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(386)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(387)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(387)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(388)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(388)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(389)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(389)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(390)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(390)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(391)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(391)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(392)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(392)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(393)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(393)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(394)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(394)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(395)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(395)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(396)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(396)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(397)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(397)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(398)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(398)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(399)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(399)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(400)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(400)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(401)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(401)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(402)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(402)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(403)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(403)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(404)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(404)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(405)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(405)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(406)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(406)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(407)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(407)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(408)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(408)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(409)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(409)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(410)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(410)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(411)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(411)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(412)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(412)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(413)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(413)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(414)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(414)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(415)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(415)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(416)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(416)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(417)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(417)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(418)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(418)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(419)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(419)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(420)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(420)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(421)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(421)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(422)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(422)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(423)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(423)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(424)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(424)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(425)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(425)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(426)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(426)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(427)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(427)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(428)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(428)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(429)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(429)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(430)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(430)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(431)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(431)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(432)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(432)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(433)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(433)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(434)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(434)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(435)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(435)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(436)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(436)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(437)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(437)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(438)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(438)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(439)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(439)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(440)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(440)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(441)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(441)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(442)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(442)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(443)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(443)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(444)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(444)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(445)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(445)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(446)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(446)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(447)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(447)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(448)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(448)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(449)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(449)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(450)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(450)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(451)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(451)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(452)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(452)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(453)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(453)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(454)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(454)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(455)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(455)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(456)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(456)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(457)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(457)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(458)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(458)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(459)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(459)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(460)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(460)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(461)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(461)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(462)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(462)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(463)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(463)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(464)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(464)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(465)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(465)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(466)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(466)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(467)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(467)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(468)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(468)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(469)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(469)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(470)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(470)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(471)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(471)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(472)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(472)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(473)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(473)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(474)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(474)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(475)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(475)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(476)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(476)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(477)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(477)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(478)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(478)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(479)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(479)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(480)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(480)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(481)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(481)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(482)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(482)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(483)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(483)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(484)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(484)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(485)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(485)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(486)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(486)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(487)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(487)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(488)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(488)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(489)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(489)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(490)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(490)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(491)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(491)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(492)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(492)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(493)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(493)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(494)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(494)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(495)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(495)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(496)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(496)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(497)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(497)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(498)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(498)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(499)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(499)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(500)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(500)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(501)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(501)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(502)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(502)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(503)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(503)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(504)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(504)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(505)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(505)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(506)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(506)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(507)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(507)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(508)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(508)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(509)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(509)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(510)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(510)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(511)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(511)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(512)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(512)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(513)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(513)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(514)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(514)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(515)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(515)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(516)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(516)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(517)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(517)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(518)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(518)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(519)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(519)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(520)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(520)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(521)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(521)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(522)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(522)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(523)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(523)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(524)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(524)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(525)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(525)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(526)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(526)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(527)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(527)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(528)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(528)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(529)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(529)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(530)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(530)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(531)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(531)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(532)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(532)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(533)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(533)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(534)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(534)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(535)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(535)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(536)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(536)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(537)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(537)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(538)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(538)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(539)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(539)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(540)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(540)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(541)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(541)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(542)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(542)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(543)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(543)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(544)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(544)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(545)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(545)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(546)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(546)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(547)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(547)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(548)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(548)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(549)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(549)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(550)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(550)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(551)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(551)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(552)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(552)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(553)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(553)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(554)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(554)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(555)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(555)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(556)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(556)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(557)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(557)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(558)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(558)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(559)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(559)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(560)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(560)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(561)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(561)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(562)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(562)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(563)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(563)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(564)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(564)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(565)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(565)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(566)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(566)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(567)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(567)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(568)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(568)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(569)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(569)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(570)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(570)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(571)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(571)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(572)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(572)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(573)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(573)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(574)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(574)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(575)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(575)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(576)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(576)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(577)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(577)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(578)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(578)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(579)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(579)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(580)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(580)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(581)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(581)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(582)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(582)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(583)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(583)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(584)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(584)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(585)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(585)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(586)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(586)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(587)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(587)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(588)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(588)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(589)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(589)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(590)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(590)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(591)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(591)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(592)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(592)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(593)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(593)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(594)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(594)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(595)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(595)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(596)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(596)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(597)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(597)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(598)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(598)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(599)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(599)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(600)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(600)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(601)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(601)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(602)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(602)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(603)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(603)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(604)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(604)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(605)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(605)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(606)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(606)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(607)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(607)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(608)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(608)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(609)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(609)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(610)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(610)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(611)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(611)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(612)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(612)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(613)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(613)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(614)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(614)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(615)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(615)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(616)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(616)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(617)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(617)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(618)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(618)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(619)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(619)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(620)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(620)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(621)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(621)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(622)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(622)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(623)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(623)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(624)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(624)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(625)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(625)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(626)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(626)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(627)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(627)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(628)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(628)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(629)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(629)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(630)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(630)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(631)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(631)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(632)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(632)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(633)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(633)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(634)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(634)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(635)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(635)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(636)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(636)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(637)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(637)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(638)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(638)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(639)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(639)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(640)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(640)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(641)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(641)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(642)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(642)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(643)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(643)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(644)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(644)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(645)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(645)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(646)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(646)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(647)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(647)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(648)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(648)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(649)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(649)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(650)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(650)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(651)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(651)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(652)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(652)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(653)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(653)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(654)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(654)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(655)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(655)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(656)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(656)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(657)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(657)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(658)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(658)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(659)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(659)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(660)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(660)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(661)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(661)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(662)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(662)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(663)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(663)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(664)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(664)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(665)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(665)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(666)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(666)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(667)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(667)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(668)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(668)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(669)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(669)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(670)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(670)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(671)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(671)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(672)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(672)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(673)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(673)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(674)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(674)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(675)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(675)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(676)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(676)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(677)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(677)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(678)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(678)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(679)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(679)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(680)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(680)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(681)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(681)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(682)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(682)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(683)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(683)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(684)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(684)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(685)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(685)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(686)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(686)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(687)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(687)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(688)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(688)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(689)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(689)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(690)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(690)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(691)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(691)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(692)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(692)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(693)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(693)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(694)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(694)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(695)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(695)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(696)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(696)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(697)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(697)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(698)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(698)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(699)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(699)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(700)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(700)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(701)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(701)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(702)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(702)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(703)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(703)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(704)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(704)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(705)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(705)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(706)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(706)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(707)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(707)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(708)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(708)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(709)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(709)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(710)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(710)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(711)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(711)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(712)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(712)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(713)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(713)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(714)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(714)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(715)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(715)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(716)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(716)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(717)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(717)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(718)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(718)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(719)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(719)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(720)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(720)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(721)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(721)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(722)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(722)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(723)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(723)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(724)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(724)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(725)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(725)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(726)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(726)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(727)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(727)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(728)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(728)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(729)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(729)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(730)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(730)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(731)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(731)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(732)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(732)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(733)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(733)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(734)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(734)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(735)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(735)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(736)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(736)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(737)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(737)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(738)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(738)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(739)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(739)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(740)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(740)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(741)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(741)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(742)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(742)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(743)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(743)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(744)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(744)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(745)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(745)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(746)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(746)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(747)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(747)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(748)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(748)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(749)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(749)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(750)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(750)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(751)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(751)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(752)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(752)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(753)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(753)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(754)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(754)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(755)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(755)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(756)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(756)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(757)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(757)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(758)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(758)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(759)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(759)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(760)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(760)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(761)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(761)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(762)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(762)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(763)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(763)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(764)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(764)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(765)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(765)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(766)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(766)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(767)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(767)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(768)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(768)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(769)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(769)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(770)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(770)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(771)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(771)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(772)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(772)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(773)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(773)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(774)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(774)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(775)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(775)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(776)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(776)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(777)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(777)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(778)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(778)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(779)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(779)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(780)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(780)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(781)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(781)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(782)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(782)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(783)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(783)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(784)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(784)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(785)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(785)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(786)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(786)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(787)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(787)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(788)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(788)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(789)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(789)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(790)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(790)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(791)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(791)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(792)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(792)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(793)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(793)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(794)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(794)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(795)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(795)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(796)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(796)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(797)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(797)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(798)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(798)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(799)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(799)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(800)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(800)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(801)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(801)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(802)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(802)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(803)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(803)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(804)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(804)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(805)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(805)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(806)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(806)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(807)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(807)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(808)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(808)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(809)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(809)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(810)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(810)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(811)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(811)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(812)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(812)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(813)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(813)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(814)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(814)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(815)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(815)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(816)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(816)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(817)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(817)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(818)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(818)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(819)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(819)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(820)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(820)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(821)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(821)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(822)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(822)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(823)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(823)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(824)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(824)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(825)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(825)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(826)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(826)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(827)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(827)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(828)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(828)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(829)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(829)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(830)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(830)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(831)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(831)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(832)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(832)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(833)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(833)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(834)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(834)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(835)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(835)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(836)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(836)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(837)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(837)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(838)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(838)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(839)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(839)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(840)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(840)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(841)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(841)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(842)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(842)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(843)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(843)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(844)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(844)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(845)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(845)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(846)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(846)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(847)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(847)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(848)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(848)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(849)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(849)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(850)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(850)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(851)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(851)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(852)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(852)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(853)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(853)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(854)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(854)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(855)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(855)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(856)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(856)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(857)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(857)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(858)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(858)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(859)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(859)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(860)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(860)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(861)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(861)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(862)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(862)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(863)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(863)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(864)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(864)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(865)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(865)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(866)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(866)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(867)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(867)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(868)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(868)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(869)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(869)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(870)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(870)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(871)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(871)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(872)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(872)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(873)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(873)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(874)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(874)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(875)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(875)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(876)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(876)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(877)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(877)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(878)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(878)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(879)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(879)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(880)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(880)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(881)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(881)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(882)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(882)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(883)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(883)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(884)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(884)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(885)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(885)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(886)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(886)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(887)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(887)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(888)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(888)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(889)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(889)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(890)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(890)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(891)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(891)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(892)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(892)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(893)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(893)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(894)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(894)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(895)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(895)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(896)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(896)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(897)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(897)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(898)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(898)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(899)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(899)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(900)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(900)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(901)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(901)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(902)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(902)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(903)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(903)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(904)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(904)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(905)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(905)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(906)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(906)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(907)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(907)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(908)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(908)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(909)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(909)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(910)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(910)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(911)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(911)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(912)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(912)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(913)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(913)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(914)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(914)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(915)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(915)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(916)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(916)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(917)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(917)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(918)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(918)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(919)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(919)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(920)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(920)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(921)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(921)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(922)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(922)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(923)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(923)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(924)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(924)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(925)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(925)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(926)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(926)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(927)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(927)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(928)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(928)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(929)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(929)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(930)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(930)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(931)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(931)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(932)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(932)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(933)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(933)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(934)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(934)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(935)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(935)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(936)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(936)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(937)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(937)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(938)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(938)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(939)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(939)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(940)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(940)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(941)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(941)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(942)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(942)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(943)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(943)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(944)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(944)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(945)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(945)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(946)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(946)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(947)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(947)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(948)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(948)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(949)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(949)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(950)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(950)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(951)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(951)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(952)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(952)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(953)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(953)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(954)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(954)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(955)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(955)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(956)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(956)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(957)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(957)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(958)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(958)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(959)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(959)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(960)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(960)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(961)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(961)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(962)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(962)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(963)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(963)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(964)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(964)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(965)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(965)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(966)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(966)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(967)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(967)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(968)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(968)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(969)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(969)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(970)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(970)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(971)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(971)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(972)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(972)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(973)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(973)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(974)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(974)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(975)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(975)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(976)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(976)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(977)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(977)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(978)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(978)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(979)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(979)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(980)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(980)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(981)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(981)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(982)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(982)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(983)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(983)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(984)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(984)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(985)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(985)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(986)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(986)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(987)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(987)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(988)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(988)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(989)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(989)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(990)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(990)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(991)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(991)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(992)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(992)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(993)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(993)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(994)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(994)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(995)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(995)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(996)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(996)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(997)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(997)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(998)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(998)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Array(999)") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Array(999)" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Length") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Length" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Reset") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Reset" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Valid") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Valid" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Traversal.Valid") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Traversal.Valid" severity Failure;
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
                    Control_Array(0) <= (others => 'U');
                else
                    Control_Array(0) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(1) <= (others => 'U');
                else
                    Control_Array(1) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(2) <= (others => 'U');
                else
                    Control_Array(2) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(3) <= (others => 'U');
                else
                    Control_Array(3) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(4) <= (others => 'U');
                else
                    Control_Array(4) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(5) <= (others => 'U');
                else
                    Control_Array(5) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(6) <= (others => 'U');
                else
                    Control_Array(6) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(7) <= (others => 'U');
                else
                    Control_Array(7) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(8) <= (others => 'U');
                else
                    Control_Array(8) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(9) <= (others => 'U');
                else
                    Control_Array(9) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(10) <= (others => 'U');
                else
                    Control_Array(10) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(11) <= (others => 'U');
                else
                    Control_Array(11) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(12) <= (others => 'U');
                else
                    Control_Array(12) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(13) <= (others => 'U');
                else
                    Control_Array(13) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(14) <= (others => 'U');
                else
                    Control_Array(14) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(15) <= (others => 'U');
                else
                    Control_Array(15) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(16) <= (others => 'U');
                else
                    Control_Array(16) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(17) <= (others => 'U');
                else
                    Control_Array(17) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(18) <= (others => 'U');
                else
                    Control_Array(18) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(19) <= (others => 'U');
                else
                    Control_Array(19) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(20) <= (others => 'U');
                else
                    Control_Array(20) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(21) <= (others => 'U');
                else
                    Control_Array(21) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(22) <= (others => 'U');
                else
                    Control_Array(22) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(23) <= (others => 'U');
                else
                    Control_Array(23) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(24) <= (others => 'U');
                else
                    Control_Array(24) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(25) <= (others => 'U');
                else
                    Control_Array(25) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(26) <= (others => 'U');
                else
                    Control_Array(26) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(27) <= (others => 'U');
                else
                    Control_Array(27) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(28) <= (others => 'U');
                else
                    Control_Array(28) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(29) <= (others => 'U');
                else
                    Control_Array(29) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(30) <= (others => 'U');
                else
                    Control_Array(30) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(31) <= (others => 'U');
                else
                    Control_Array(31) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(32) <= (others => 'U');
                else
                    Control_Array(32) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(33) <= (others => 'U');
                else
                    Control_Array(33) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(34) <= (others => 'U');
                else
                    Control_Array(34) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(35) <= (others => 'U');
                else
                    Control_Array(35) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(36) <= (others => 'U');
                else
                    Control_Array(36) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(37) <= (others => 'U');
                else
                    Control_Array(37) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(38) <= (others => 'U');
                else
                    Control_Array(38) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(39) <= (others => 'U');
                else
                    Control_Array(39) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(40) <= (others => 'U');
                else
                    Control_Array(40) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(41) <= (others => 'U');
                else
                    Control_Array(41) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(42) <= (others => 'U');
                else
                    Control_Array(42) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(43) <= (others => 'U');
                else
                    Control_Array(43) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(44) <= (others => 'U');
                else
                    Control_Array(44) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(45) <= (others => 'U');
                else
                    Control_Array(45) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(46) <= (others => 'U');
                else
                    Control_Array(46) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(47) <= (others => 'U');
                else
                    Control_Array(47) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(48) <= (others => 'U');
                else
                    Control_Array(48) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(49) <= (others => 'U');
                else
                    Control_Array(49) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(50) <= (others => 'U');
                else
                    Control_Array(50) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(51) <= (others => 'U');
                else
                    Control_Array(51) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(52) <= (others => 'U');
                else
                    Control_Array(52) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(53) <= (others => 'U');
                else
                    Control_Array(53) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(54) <= (others => 'U');
                else
                    Control_Array(54) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(55) <= (others => 'U');
                else
                    Control_Array(55) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(56) <= (others => 'U');
                else
                    Control_Array(56) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(57) <= (others => 'U');
                else
                    Control_Array(57) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(58) <= (others => 'U');
                else
                    Control_Array(58) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(59) <= (others => 'U');
                else
                    Control_Array(59) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(60) <= (others => 'U');
                else
                    Control_Array(60) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(61) <= (others => 'U');
                else
                    Control_Array(61) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(62) <= (others => 'U');
                else
                    Control_Array(62) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(63) <= (others => 'U');
                else
                    Control_Array(63) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(64) <= (others => 'U');
                else
                    Control_Array(64) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(65) <= (others => 'U');
                else
                    Control_Array(65) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(66) <= (others => 'U');
                else
                    Control_Array(66) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(67) <= (others => 'U');
                else
                    Control_Array(67) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(68) <= (others => 'U');
                else
                    Control_Array(68) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(69) <= (others => 'U');
                else
                    Control_Array(69) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(70) <= (others => 'U');
                else
                    Control_Array(70) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(71) <= (others => 'U');
                else
                    Control_Array(71) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(72) <= (others => 'U');
                else
                    Control_Array(72) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(73) <= (others => 'U');
                else
                    Control_Array(73) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(74) <= (others => 'U');
                else
                    Control_Array(74) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(75) <= (others => 'U');
                else
                    Control_Array(75) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(76) <= (others => 'U');
                else
                    Control_Array(76) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(77) <= (others => 'U');
                else
                    Control_Array(77) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(78) <= (others => 'U');
                else
                    Control_Array(78) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(79) <= (others => 'U');
                else
                    Control_Array(79) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(80) <= (others => 'U');
                else
                    Control_Array(80) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(81) <= (others => 'U');
                else
                    Control_Array(81) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(82) <= (others => 'U');
                else
                    Control_Array(82) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(83) <= (others => 'U');
                else
                    Control_Array(83) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(84) <= (others => 'U');
                else
                    Control_Array(84) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(85) <= (others => 'U');
                else
                    Control_Array(85) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(86) <= (others => 'U');
                else
                    Control_Array(86) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(87) <= (others => 'U');
                else
                    Control_Array(87) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(88) <= (others => 'U');
                else
                    Control_Array(88) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(89) <= (others => 'U');
                else
                    Control_Array(89) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(90) <= (others => 'U');
                else
                    Control_Array(90) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(91) <= (others => 'U');
                else
                    Control_Array(91) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(92) <= (others => 'U');
                else
                    Control_Array(92) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(93) <= (others => 'U');
                else
                    Control_Array(93) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(94) <= (others => 'U');
                else
                    Control_Array(94) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(95) <= (others => 'U');
                else
                    Control_Array(95) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(96) <= (others => 'U');
                else
                    Control_Array(96) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(97) <= (others => 'U');
                else
                    Control_Array(97) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(98) <= (others => 'U');
                else
                    Control_Array(98) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(99) <= (others => 'U');
                else
                    Control_Array(99) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(100) <= (others => 'U');
                else
                    Control_Array(100) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(101) <= (others => 'U');
                else
                    Control_Array(101) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(102) <= (others => 'U');
                else
                    Control_Array(102) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(103) <= (others => 'U');
                else
                    Control_Array(103) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(104) <= (others => 'U');
                else
                    Control_Array(104) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(105) <= (others => 'U');
                else
                    Control_Array(105) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(106) <= (others => 'U');
                else
                    Control_Array(106) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(107) <= (others => 'U');
                else
                    Control_Array(107) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(108) <= (others => 'U');
                else
                    Control_Array(108) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(109) <= (others => 'U');
                else
                    Control_Array(109) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(110) <= (others => 'U');
                else
                    Control_Array(110) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(111) <= (others => 'U');
                else
                    Control_Array(111) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(112) <= (others => 'U');
                else
                    Control_Array(112) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(113) <= (others => 'U');
                else
                    Control_Array(113) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(114) <= (others => 'U');
                else
                    Control_Array(114) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(115) <= (others => 'U');
                else
                    Control_Array(115) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(116) <= (others => 'U');
                else
                    Control_Array(116) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(117) <= (others => 'U');
                else
                    Control_Array(117) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(118) <= (others => 'U');
                else
                    Control_Array(118) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(119) <= (others => 'U');
                else
                    Control_Array(119) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(120) <= (others => 'U');
                else
                    Control_Array(120) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(121) <= (others => 'U');
                else
                    Control_Array(121) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(122) <= (others => 'U');
                else
                    Control_Array(122) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(123) <= (others => 'U');
                else
                    Control_Array(123) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(124) <= (others => 'U');
                else
                    Control_Array(124) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(125) <= (others => 'U');
                else
                    Control_Array(125) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(126) <= (others => 'U');
                else
                    Control_Array(126) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(127) <= (others => 'U');
                else
                    Control_Array(127) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(128) <= (others => 'U');
                else
                    Control_Array(128) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(129) <= (others => 'U');
                else
                    Control_Array(129) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(130) <= (others => 'U');
                else
                    Control_Array(130) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(131) <= (others => 'U');
                else
                    Control_Array(131) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(132) <= (others => 'U');
                else
                    Control_Array(132) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(133) <= (others => 'U');
                else
                    Control_Array(133) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(134) <= (others => 'U');
                else
                    Control_Array(134) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(135) <= (others => 'U');
                else
                    Control_Array(135) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(136) <= (others => 'U');
                else
                    Control_Array(136) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(137) <= (others => 'U');
                else
                    Control_Array(137) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(138) <= (others => 'U');
                else
                    Control_Array(138) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(139) <= (others => 'U');
                else
                    Control_Array(139) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(140) <= (others => 'U');
                else
                    Control_Array(140) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(141) <= (others => 'U');
                else
                    Control_Array(141) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(142) <= (others => 'U');
                else
                    Control_Array(142) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(143) <= (others => 'U');
                else
                    Control_Array(143) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(144) <= (others => 'U');
                else
                    Control_Array(144) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(145) <= (others => 'U');
                else
                    Control_Array(145) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(146) <= (others => 'U');
                else
                    Control_Array(146) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(147) <= (others => 'U');
                else
                    Control_Array(147) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(148) <= (others => 'U');
                else
                    Control_Array(148) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(149) <= (others => 'U');
                else
                    Control_Array(149) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(150) <= (others => 'U');
                else
                    Control_Array(150) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(151) <= (others => 'U');
                else
                    Control_Array(151) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(152) <= (others => 'U');
                else
                    Control_Array(152) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(153) <= (others => 'U');
                else
                    Control_Array(153) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(154) <= (others => 'U');
                else
                    Control_Array(154) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(155) <= (others => 'U');
                else
                    Control_Array(155) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(156) <= (others => 'U');
                else
                    Control_Array(156) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(157) <= (others => 'U');
                else
                    Control_Array(157) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(158) <= (others => 'U');
                else
                    Control_Array(158) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(159) <= (others => 'U');
                else
                    Control_Array(159) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(160) <= (others => 'U');
                else
                    Control_Array(160) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(161) <= (others => 'U');
                else
                    Control_Array(161) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(162) <= (others => 'U');
                else
                    Control_Array(162) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(163) <= (others => 'U');
                else
                    Control_Array(163) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(164) <= (others => 'U');
                else
                    Control_Array(164) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(165) <= (others => 'U');
                else
                    Control_Array(165) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(166) <= (others => 'U');
                else
                    Control_Array(166) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(167) <= (others => 'U');
                else
                    Control_Array(167) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(168) <= (others => 'U');
                else
                    Control_Array(168) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(169) <= (others => 'U');
                else
                    Control_Array(169) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(170) <= (others => 'U');
                else
                    Control_Array(170) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(171) <= (others => 'U');
                else
                    Control_Array(171) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(172) <= (others => 'U');
                else
                    Control_Array(172) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(173) <= (others => 'U');
                else
                    Control_Array(173) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(174) <= (others => 'U');
                else
                    Control_Array(174) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(175) <= (others => 'U');
                else
                    Control_Array(175) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(176) <= (others => 'U');
                else
                    Control_Array(176) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(177) <= (others => 'U');
                else
                    Control_Array(177) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(178) <= (others => 'U');
                else
                    Control_Array(178) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(179) <= (others => 'U');
                else
                    Control_Array(179) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(180) <= (others => 'U');
                else
                    Control_Array(180) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(181) <= (others => 'U');
                else
                    Control_Array(181) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(182) <= (others => 'U');
                else
                    Control_Array(182) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(183) <= (others => 'U');
                else
                    Control_Array(183) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(184) <= (others => 'U');
                else
                    Control_Array(184) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(185) <= (others => 'U');
                else
                    Control_Array(185) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(186) <= (others => 'U');
                else
                    Control_Array(186) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(187) <= (others => 'U');
                else
                    Control_Array(187) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(188) <= (others => 'U');
                else
                    Control_Array(188) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(189) <= (others => 'U');
                else
                    Control_Array(189) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(190) <= (others => 'U');
                else
                    Control_Array(190) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(191) <= (others => 'U');
                else
                    Control_Array(191) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(192) <= (others => 'U');
                else
                    Control_Array(192) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(193) <= (others => 'U');
                else
                    Control_Array(193) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(194) <= (others => 'U');
                else
                    Control_Array(194) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(195) <= (others => 'U');
                else
                    Control_Array(195) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(196) <= (others => 'U');
                else
                    Control_Array(196) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(197) <= (others => 'U');
                else
                    Control_Array(197) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(198) <= (others => 'U');
                else
                    Control_Array(198) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(199) <= (others => 'U');
                else
                    Control_Array(199) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(200) <= (others => 'U');
                else
                    Control_Array(200) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(201) <= (others => 'U');
                else
                    Control_Array(201) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(202) <= (others => 'U');
                else
                    Control_Array(202) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(203) <= (others => 'U');
                else
                    Control_Array(203) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(204) <= (others => 'U');
                else
                    Control_Array(204) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(205) <= (others => 'U');
                else
                    Control_Array(205) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(206) <= (others => 'U');
                else
                    Control_Array(206) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(207) <= (others => 'U');
                else
                    Control_Array(207) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(208) <= (others => 'U');
                else
                    Control_Array(208) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(209) <= (others => 'U');
                else
                    Control_Array(209) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(210) <= (others => 'U');
                else
                    Control_Array(210) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(211) <= (others => 'U');
                else
                    Control_Array(211) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(212) <= (others => 'U');
                else
                    Control_Array(212) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(213) <= (others => 'U');
                else
                    Control_Array(213) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(214) <= (others => 'U');
                else
                    Control_Array(214) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(215) <= (others => 'U');
                else
                    Control_Array(215) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(216) <= (others => 'U');
                else
                    Control_Array(216) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(217) <= (others => 'U');
                else
                    Control_Array(217) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(218) <= (others => 'U');
                else
                    Control_Array(218) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(219) <= (others => 'U');
                else
                    Control_Array(219) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(220) <= (others => 'U');
                else
                    Control_Array(220) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(221) <= (others => 'U');
                else
                    Control_Array(221) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(222) <= (others => 'U');
                else
                    Control_Array(222) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(223) <= (others => 'U');
                else
                    Control_Array(223) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(224) <= (others => 'U');
                else
                    Control_Array(224) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(225) <= (others => 'U');
                else
                    Control_Array(225) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(226) <= (others => 'U');
                else
                    Control_Array(226) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(227) <= (others => 'U');
                else
                    Control_Array(227) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(228) <= (others => 'U');
                else
                    Control_Array(228) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(229) <= (others => 'U');
                else
                    Control_Array(229) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(230) <= (others => 'U');
                else
                    Control_Array(230) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(231) <= (others => 'U');
                else
                    Control_Array(231) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(232) <= (others => 'U');
                else
                    Control_Array(232) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(233) <= (others => 'U');
                else
                    Control_Array(233) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(234) <= (others => 'U');
                else
                    Control_Array(234) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(235) <= (others => 'U');
                else
                    Control_Array(235) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(236) <= (others => 'U');
                else
                    Control_Array(236) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(237) <= (others => 'U');
                else
                    Control_Array(237) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(238) <= (others => 'U');
                else
                    Control_Array(238) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(239) <= (others => 'U');
                else
                    Control_Array(239) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(240) <= (others => 'U');
                else
                    Control_Array(240) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(241) <= (others => 'U');
                else
                    Control_Array(241) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(242) <= (others => 'U');
                else
                    Control_Array(242) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(243) <= (others => 'U');
                else
                    Control_Array(243) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(244) <= (others => 'U');
                else
                    Control_Array(244) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(245) <= (others => 'U');
                else
                    Control_Array(245) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(246) <= (others => 'U');
                else
                    Control_Array(246) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(247) <= (others => 'U');
                else
                    Control_Array(247) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(248) <= (others => 'U');
                else
                    Control_Array(248) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(249) <= (others => 'U');
                else
                    Control_Array(249) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(250) <= (others => 'U');
                else
                    Control_Array(250) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(251) <= (others => 'U');
                else
                    Control_Array(251) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(252) <= (others => 'U');
                else
                    Control_Array(252) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(253) <= (others => 'U');
                else
                    Control_Array(253) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(254) <= (others => 'U');
                else
                    Control_Array(254) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(255) <= (others => 'U');
                else
                    Control_Array(255) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(256) <= (others => 'U');
                else
                    Control_Array(256) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(257) <= (others => 'U');
                else
                    Control_Array(257) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(258) <= (others => 'U');
                else
                    Control_Array(258) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(259) <= (others => 'U');
                else
                    Control_Array(259) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(260) <= (others => 'U');
                else
                    Control_Array(260) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(261) <= (others => 'U');
                else
                    Control_Array(261) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(262) <= (others => 'U');
                else
                    Control_Array(262) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(263) <= (others => 'U');
                else
                    Control_Array(263) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(264) <= (others => 'U');
                else
                    Control_Array(264) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(265) <= (others => 'U');
                else
                    Control_Array(265) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(266) <= (others => 'U');
                else
                    Control_Array(266) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(267) <= (others => 'U');
                else
                    Control_Array(267) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(268) <= (others => 'U');
                else
                    Control_Array(268) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(269) <= (others => 'U');
                else
                    Control_Array(269) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(270) <= (others => 'U');
                else
                    Control_Array(270) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(271) <= (others => 'U');
                else
                    Control_Array(271) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(272) <= (others => 'U');
                else
                    Control_Array(272) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(273) <= (others => 'U');
                else
                    Control_Array(273) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(274) <= (others => 'U');
                else
                    Control_Array(274) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(275) <= (others => 'U');
                else
                    Control_Array(275) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(276) <= (others => 'U');
                else
                    Control_Array(276) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(277) <= (others => 'U');
                else
                    Control_Array(277) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(278) <= (others => 'U');
                else
                    Control_Array(278) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(279) <= (others => 'U');
                else
                    Control_Array(279) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(280) <= (others => 'U');
                else
                    Control_Array(280) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(281) <= (others => 'U');
                else
                    Control_Array(281) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(282) <= (others => 'U');
                else
                    Control_Array(282) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(283) <= (others => 'U');
                else
                    Control_Array(283) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(284) <= (others => 'U');
                else
                    Control_Array(284) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(285) <= (others => 'U');
                else
                    Control_Array(285) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(286) <= (others => 'U');
                else
                    Control_Array(286) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(287) <= (others => 'U');
                else
                    Control_Array(287) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(288) <= (others => 'U');
                else
                    Control_Array(288) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(289) <= (others => 'U');
                else
                    Control_Array(289) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(290) <= (others => 'U');
                else
                    Control_Array(290) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(291) <= (others => 'U');
                else
                    Control_Array(291) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(292) <= (others => 'U');
                else
                    Control_Array(292) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(293) <= (others => 'U');
                else
                    Control_Array(293) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(294) <= (others => 'U');
                else
                    Control_Array(294) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(295) <= (others => 'U');
                else
                    Control_Array(295) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(296) <= (others => 'U');
                else
                    Control_Array(296) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(297) <= (others => 'U');
                else
                    Control_Array(297) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(298) <= (others => 'U');
                else
                    Control_Array(298) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(299) <= (others => 'U');
                else
                    Control_Array(299) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(300) <= (others => 'U');
                else
                    Control_Array(300) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(301) <= (others => 'U');
                else
                    Control_Array(301) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(302) <= (others => 'U');
                else
                    Control_Array(302) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(303) <= (others => 'U');
                else
                    Control_Array(303) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(304) <= (others => 'U');
                else
                    Control_Array(304) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(305) <= (others => 'U');
                else
                    Control_Array(305) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(306) <= (others => 'U');
                else
                    Control_Array(306) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(307) <= (others => 'U');
                else
                    Control_Array(307) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(308) <= (others => 'U');
                else
                    Control_Array(308) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(309) <= (others => 'U');
                else
                    Control_Array(309) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(310) <= (others => 'U');
                else
                    Control_Array(310) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(311) <= (others => 'U');
                else
                    Control_Array(311) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(312) <= (others => 'U');
                else
                    Control_Array(312) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(313) <= (others => 'U');
                else
                    Control_Array(313) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(314) <= (others => 'U');
                else
                    Control_Array(314) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(315) <= (others => 'U');
                else
                    Control_Array(315) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(316) <= (others => 'U');
                else
                    Control_Array(316) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(317) <= (others => 'U');
                else
                    Control_Array(317) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(318) <= (others => 'U');
                else
                    Control_Array(318) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(319) <= (others => 'U');
                else
                    Control_Array(319) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(320) <= (others => 'U');
                else
                    Control_Array(320) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(321) <= (others => 'U');
                else
                    Control_Array(321) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(322) <= (others => 'U');
                else
                    Control_Array(322) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(323) <= (others => 'U');
                else
                    Control_Array(323) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(324) <= (others => 'U');
                else
                    Control_Array(324) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(325) <= (others => 'U');
                else
                    Control_Array(325) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(326) <= (others => 'U');
                else
                    Control_Array(326) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(327) <= (others => 'U');
                else
                    Control_Array(327) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(328) <= (others => 'U');
                else
                    Control_Array(328) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(329) <= (others => 'U');
                else
                    Control_Array(329) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(330) <= (others => 'U');
                else
                    Control_Array(330) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(331) <= (others => 'U');
                else
                    Control_Array(331) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(332) <= (others => 'U');
                else
                    Control_Array(332) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(333) <= (others => 'U');
                else
                    Control_Array(333) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(334) <= (others => 'U');
                else
                    Control_Array(334) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(335) <= (others => 'U');
                else
                    Control_Array(335) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(336) <= (others => 'U');
                else
                    Control_Array(336) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(337) <= (others => 'U');
                else
                    Control_Array(337) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(338) <= (others => 'U');
                else
                    Control_Array(338) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(339) <= (others => 'U');
                else
                    Control_Array(339) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(340) <= (others => 'U');
                else
                    Control_Array(340) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(341) <= (others => 'U');
                else
                    Control_Array(341) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(342) <= (others => 'U');
                else
                    Control_Array(342) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(343) <= (others => 'U');
                else
                    Control_Array(343) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(344) <= (others => 'U');
                else
                    Control_Array(344) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(345) <= (others => 'U');
                else
                    Control_Array(345) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(346) <= (others => 'U');
                else
                    Control_Array(346) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(347) <= (others => 'U');
                else
                    Control_Array(347) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(348) <= (others => 'U');
                else
                    Control_Array(348) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(349) <= (others => 'U');
                else
                    Control_Array(349) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(350) <= (others => 'U');
                else
                    Control_Array(350) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(351) <= (others => 'U');
                else
                    Control_Array(351) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(352) <= (others => 'U');
                else
                    Control_Array(352) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(353) <= (others => 'U');
                else
                    Control_Array(353) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(354) <= (others => 'U');
                else
                    Control_Array(354) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(355) <= (others => 'U');
                else
                    Control_Array(355) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(356) <= (others => 'U');
                else
                    Control_Array(356) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(357) <= (others => 'U');
                else
                    Control_Array(357) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(358) <= (others => 'U');
                else
                    Control_Array(358) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(359) <= (others => 'U');
                else
                    Control_Array(359) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(360) <= (others => 'U');
                else
                    Control_Array(360) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(361) <= (others => 'U');
                else
                    Control_Array(361) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(362) <= (others => 'U');
                else
                    Control_Array(362) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(363) <= (others => 'U');
                else
                    Control_Array(363) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(364) <= (others => 'U');
                else
                    Control_Array(364) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(365) <= (others => 'U');
                else
                    Control_Array(365) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(366) <= (others => 'U');
                else
                    Control_Array(366) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(367) <= (others => 'U');
                else
                    Control_Array(367) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(368) <= (others => 'U');
                else
                    Control_Array(368) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(369) <= (others => 'U');
                else
                    Control_Array(369) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(370) <= (others => 'U');
                else
                    Control_Array(370) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(371) <= (others => 'U');
                else
                    Control_Array(371) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(372) <= (others => 'U');
                else
                    Control_Array(372) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(373) <= (others => 'U');
                else
                    Control_Array(373) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(374) <= (others => 'U');
                else
                    Control_Array(374) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(375) <= (others => 'U');
                else
                    Control_Array(375) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(376) <= (others => 'U');
                else
                    Control_Array(376) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(377) <= (others => 'U');
                else
                    Control_Array(377) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(378) <= (others => 'U');
                else
                    Control_Array(378) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(379) <= (others => 'U');
                else
                    Control_Array(379) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(380) <= (others => 'U');
                else
                    Control_Array(380) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(381) <= (others => 'U');
                else
                    Control_Array(381) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(382) <= (others => 'U');
                else
                    Control_Array(382) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(383) <= (others => 'U');
                else
                    Control_Array(383) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(384) <= (others => 'U');
                else
                    Control_Array(384) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(385) <= (others => 'U');
                else
                    Control_Array(385) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(386) <= (others => 'U');
                else
                    Control_Array(386) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(387) <= (others => 'U');
                else
                    Control_Array(387) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(388) <= (others => 'U');
                else
                    Control_Array(388) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(389) <= (others => 'U');
                else
                    Control_Array(389) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(390) <= (others => 'U');
                else
                    Control_Array(390) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(391) <= (others => 'U');
                else
                    Control_Array(391) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(392) <= (others => 'U');
                else
                    Control_Array(392) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(393) <= (others => 'U');
                else
                    Control_Array(393) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(394) <= (others => 'U');
                else
                    Control_Array(394) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(395) <= (others => 'U');
                else
                    Control_Array(395) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(396) <= (others => 'U');
                else
                    Control_Array(396) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(397) <= (others => 'U');
                else
                    Control_Array(397) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(398) <= (others => 'U');
                else
                    Control_Array(398) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(399) <= (others => 'U');
                else
                    Control_Array(399) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(400) <= (others => 'U');
                else
                    Control_Array(400) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(401) <= (others => 'U');
                else
                    Control_Array(401) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(402) <= (others => 'U');
                else
                    Control_Array(402) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(403) <= (others => 'U');
                else
                    Control_Array(403) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(404) <= (others => 'U');
                else
                    Control_Array(404) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(405) <= (others => 'U');
                else
                    Control_Array(405) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(406) <= (others => 'U');
                else
                    Control_Array(406) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(407) <= (others => 'U');
                else
                    Control_Array(407) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(408) <= (others => 'U');
                else
                    Control_Array(408) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(409) <= (others => 'U');
                else
                    Control_Array(409) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(410) <= (others => 'U');
                else
                    Control_Array(410) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(411) <= (others => 'U');
                else
                    Control_Array(411) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(412) <= (others => 'U');
                else
                    Control_Array(412) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(413) <= (others => 'U');
                else
                    Control_Array(413) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(414) <= (others => 'U');
                else
                    Control_Array(414) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(415) <= (others => 'U');
                else
                    Control_Array(415) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(416) <= (others => 'U');
                else
                    Control_Array(416) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(417) <= (others => 'U');
                else
                    Control_Array(417) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(418) <= (others => 'U');
                else
                    Control_Array(418) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(419) <= (others => 'U');
                else
                    Control_Array(419) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(420) <= (others => 'U');
                else
                    Control_Array(420) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(421) <= (others => 'U');
                else
                    Control_Array(421) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(422) <= (others => 'U');
                else
                    Control_Array(422) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(423) <= (others => 'U');
                else
                    Control_Array(423) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(424) <= (others => 'U');
                else
                    Control_Array(424) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(425) <= (others => 'U');
                else
                    Control_Array(425) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(426) <= (others => 'U');
                else
                    Control_Array(426) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(427) <= (others => 'U');
                else
                    Control_Array(427) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(428) <= (others => 'U');
                else
                    Control_Array(428) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(429) <= (others => 'U');
                else
                    Control_Array(429) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(430) <= (others => 'U');
                else
                    Control_Array(430) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(431) <= (others => 'U');
                else
                    Control_Array(431) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(432) <= (others => 'U');
                else
                    Control_Array(432) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(433) <= (others => 'U');
                else
                    Control_Array(433) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(434) <= (others => 'U');
                else
                    Control_Array(434) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(435) <= (others => 'U');
                else
                    Control_Array(435) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(436) <= (others => 'U');
                else
                    Control_Array(436) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(437) <= (others => 'U');
                else
                    Control_Array(437) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(438) <= (others => 'U');
                else
                    Control_Array(438) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(439) <= (others => 'U');
                else
                    Control_Array(439) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(440) <= (others => 'U');
                else
                    Control_Array(440) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(441) <= (others => 'U');
                else
                    Control_Array(441) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(442) <= (others => 'U');
                else
                    Control_Array(442) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(443) <= (others => 'U');
                else
                    Control_Array(443) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(444) <= (others => 'U');
                else
                    Control_Array(444) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(445) <= (others => 'U');
                else
                    Control_Array(445) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(446) <= (others => 'U');
                else
                    Control_Array(446) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(447) <= (others => 'U');
                else
                    Control_Array(447) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(448) <= (others => 'U');
                else
                    Control_Array(448) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(449) <= (others => 'U');
                else
                    Control_Array(449) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(450) <= (others => 'U');
                else
                    Control_Array(450) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(451) <= (others => 'U');
                else
                    Control_Array(451) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(452) <= (others => 'U');
                else
                    Control_Array(452) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(453) <= (others => 'U');
                else
                    Control_Array(453) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(454) <= (others => 'U');
                else
                    Control_Array(454) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(455) <= (others => 'U');
                else
                    Control_Array(455) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(456) <= (others => 'U');
                else
                    Control_Array(456) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(457) <= (others => 'U');
                else
                    Control_Array(457) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(458) <= (others => 'U');
                else
                    Control_Array(458) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(459) <= (others => 'U');
                else
                    Control_Array(459) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(460) <= (others => 'U');
                else
                    Control_Array(460) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(461) <= (others => 'U');
                else
                    Control_Array(461) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(462) <= (others => 'U');
                else
                    Control_Array(462) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(463) <= (others => 'U');
                else
                    Control_Array(463) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(464) <= (others => 'U');
                else
                    Control_Array(464) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(465) <= (others => 'U');
                else
                    Control_Array(465) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(466) <= (others => 'U');
                else
                    Control_Array(466) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(467) <= (others => 'U');
                else
                    Control_Array(467) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(468) <= (others => 'U');
                else
                    Control_Array(468) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(469) <= (others => 'U');
                else
                    Control_Array(469) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(470) <= (others => 'U');
                else
                    Control_Array(470) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(471) <= (others => 'U');
                else
                    Control_Array(471) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(472) <= (others => 'U');
                else
                    Control_Array(472) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(473) <= (others => 'U');
                else
                    Control_Array(473) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(474) <= (others => 'U');
                else
                    Control_Array(474) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(475) <= (others => 'U');
                else
                    Control_Array(475) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(476) <= (others => 'U');
                else
                    Control_Array(476) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(477) <= (others => 'U');
                else
                    Control_Array(477) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(478) <= (others => 'U');
                else
                    Control_Array(478) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(479) <= (others => 'U');
                else
                    Control_Array(479) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(480) <= (others => 'U');
                else
                    Control_Array(480) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(481) <= (others => 'U');
                else
                    Control_Array(481) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(482) <= (others => 'U');
                else
                    Control_Array(482) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(483) <= (others => 'U');
                else
                    Control_Array(483) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(484) <= (others => 'U');
                else
                    Control_Array(484) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(485) <= (others => 'U');
                else
                    Control_Array(485) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(486) <= (others => 'U');
                else
                    Control_Array(486) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(487) <= (others => 'U');
                else
                    Control_Array(487) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(488) <= (others => 'U');
                else
                    Control_Array(488) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(489) <= (others => 'U');
                else
                    Control_Array(489) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(490) <= (others => 'U');
                else
                    Control_Array(490) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(491) <= (others => 'U');
                else
                    Control_Array(491) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(492) <= (others => 'U');
                else
                    Control_Array(492) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(493) <= (others => 'U');
                else
                    Control_Array(493) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(494) <= (others => 'U');
                else
                    Control_Array(494) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(495) <= (others => 'U');
                else
                    Control_Array(495) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(496) <= (others => 'U');
                else
                    Control_Array(496) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(497) <= (others => 'U');
                else
                    Control_Array(497) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(498) <= (others => 'U');
                else
                    Control_Array(498) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(499) <= (others => 'U');
                else
                    Control_Array(499) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(500) <= (others => 'U');
                else
                    Control_Array(500) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(501) <= (others => 'U');
                else
                    Control_Array(501) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(502) <= (others => 'U');
                else
                    Control_Array(502) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(503) <= (others => 'U');
                else
                    Control_Array(503) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(504) <= (others => 'U');
                else
                    Control_Array(504) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(505) <= (others => 'U');
                else
                    Control_Array(505) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(506) <= (others => 'U');
                else
                    Control_Array(506) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(507) <= (others => 'U');
                else
                    Control_Array(507) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(508) <= (others => 'U');
                else
                    Control_Array(508) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(509) <= (others => 'U');
                else
                    Control_Array(509) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(510) <= (others => 'U');
                else
                    Control_Array(510) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(511) <= (others => 'U');
                else
                    Control_Array(511) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(512) <= (others => 'U');
                else
                    Control_Array(512) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(513) <= (others => 'U');
                else
                    Control_Array(513) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(514) <= (others => 'U');
                else
                    Control_Array(514) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(515) <= (others => 'U');
                else
                    Control_Array(515) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(516) <= (others => 'U');
                else
                    Control_Array(516) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(517) <= (others => 'U');
                else
                    Control_Array(517) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(518) <= (others => 'U');
                else
                    Control_Array(518) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(519) <= (others => 'U');
                else
                    Control_Array(519) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(520) <= (others => 'U');
                else
                    Control_Array(520) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(521) <= (others => 'U');
                else
                    Control_Array(521) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(522) <= (others => 'U');
                else
                    Control_Array(522) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(523) <= (others => 'U');
                else
                    Control_Array(523) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(524) <= (others => 'U');
                else
                    Control_Array(524) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(525) <= (others => 'U');
                else
                    Control_Array(525) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(526) <= (others => 'U');
                else
                    Control_Array(526) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(527) <= (others => 'U');
                else
                    Control_Array(527) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(528) <= (others => 'U');
                else
                    Control_Array(528) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(529) <= (others => 'U');
                else
                    Control_Array(529) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(530) <= (others => 'U');
                else
                    Control_Array(530) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(531) <= (others => 'U');
                else
                    Control_Array(531) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(532) <= (others => 'U');
                else
                    Control_Array(532) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(533) <= (others => 'U');
                else
                    Control_Array(533) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(534) <= (others => 'U');
                else
                    Control_Array(534) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(535) <= (others => 'U');
                else
                    Control_Array(535) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(536) <= (others => 'U');
                else
                    Control_Array(536) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(537) <= (others => 'U');
                else
                    Control_Array(537) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(538) <= (others => 'U');
                else
                    Control_Array(538) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(539) <= (others => 'U');
                else
                    Control_Array(539) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(540) <= (others => 'U');
                else
                    Control_Array(540) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(541) <= (others => 'U');
                else
                    Control_Array(541) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(542) <= (others => 'U');
                else
                    Control_Array(542) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(543) <= (others => 'U');
                else
                    Control_Array(543) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(544) <= (others => 'U');
                else
                    Control_Array(544) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(545) <= (others => 'U');
                else
                    Control_Array(545) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(546) <= (others => 'U');
                else
                    Control_Array(546) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(547) <= (others => 'U');
                else
                    Control_Array(547) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(548) <= (others => 'U');
                else
                    Control_Array(548) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(549) <= (others => 'U');
                else
                    Control_Array(549) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(550) <= (others => 'U');
                else
                    Control_Array(550) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(551) <= (others => 'U');
                else
                    Control_Array(551) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(552) <= (others => 'U');
                else
                    Control_Array(552) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(553) <= (others => 'U');
                else
                    Control_Array(553) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(554) <= (others => 'U');
                else
                    Control_Array(554) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(555) <= (others => 'U');
                else
                    Control_Array(555) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(556) <= (others => 'U');
                else
                    Control_Array(556) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(557) <= (others => 'U');
                else
                    Control_Array(557) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(558) <= (others => 'U');
                else
                    Control_Array(558) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(559) <= (others => 'U');
                else
                    Control_Array(559) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(560) <= (others => 'U');
                else
                    Control_Array(560) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(561) <= (others => 'U');
                else
                    Control_Array(561) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(562) <= (others => 'U');
                else
                    Control_Array(562) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(563) <= (others => 'U');
                else
                    Control_Array(563) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(564) <= (others => 'U');
                else
                    Control_Array(564) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(565) <= (others => 'U');
                else
                    Control_Array(565) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(566) <= (others => 'U');
                else
                    Control_Array(566) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(567) <= (others => 'U');
                else
                    Control_Array(567) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(568) <= (others => 'U');
                else
                    Control_Array(568) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(569) <= (others => 'U');
                else
                    Control_Array(569) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(570) <= (others => 'U');
                else
                    Control_Array(570) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(571) <= (others => 'U');
                else
                    Control_Array(571) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(572) <= (others => 'U');
                else
                    Control_Array(572) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(573) <= (others => 'U');
                else
                    Control_Array(573) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(574) <= (others => 'U');
                else
                    Control_Array(574) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(575) <= (others => 'U');
                else
                    Control_Array(575) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(576) <= (others => 'U');
                else
                    Control_Array(576) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(577) <= (others => 'U');
                else
                    Control_Array(577) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(578) <= (others => 'U');
                else
                    Control_Array(578) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(579) <= (others => 'U');
                else
                    Control_Array(579) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(580) <= (others => 'U');
                else
                    Control_Array(580) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(581) <= (others => 'U');
                else
                    Control_Array(581) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(582) <= (others => 'U');
                else
                    Control_Array(582) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(583) <= (others => 'U');
                else
                    Control_Array(583) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(584) <= (others => 'U');
                else
                    Control_Array(584) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(585) <= (others => 'U');
                else
                    Control_Array(585) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(586) <= (others => 'U');
                else
                    Control_Array(586) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(587) <= (others => 'U');
                else
                    Control_Array(587) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(588) <= (others => 'U');
                else
                    Control_Array(588) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(589) <= (others => 'U');
                else
                    Control_Array(589) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(590) <= (others => 'U');
                else
                    Control_Array(590) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(591) <= (others => 'U');
                else
                    Control_Array(591) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(592) <= (others => 'U');
                else
                    Control_Array(592) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(593) <= (others => 'U');
                else
                    Control_Array(593) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(594) <= (others => 'U');
                else
                    Control_Array(594) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(595) <= (others => 'U');
                else
                    Control_Array(595) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(596) <= (others => 'U');
                else
                    Control_Array(596) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(597) <= (others => 'U');
                else
                    Control_Array(597) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(598) <= (others => 'U');
                else
                    Control_Array(598) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(599) <= (others => 'U');
                else
                    Control_Array(599) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(600) <= (others => 'U');
                else
                    Control_Array(600) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(601) <= (others => 'U');
                else
                    Control_Array(601) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(602) <= (others => 'U');
                else
                    Control_Array(602) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(603) <= (others => 'U');
                else
                    Control_Array(603) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(604) <= (others => 'U');
                else
                    Control_Array(604) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(605) <= (others => 'U');
                else
                    Control_Array(605) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(606) <= (others => 'U');
                else
                    Control_Array(606) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(607) <= (others => 'U');
                else
                    Control_Array(607) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(608) <= (others => 'U');
                else
                    Control_Array(608) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(609) <= (others => 'U');
                else
                    Control_Array(609) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(610) <= (others => 'U');
                else
                    Control_Array(610) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(611) <= (others => 'U');
                else
                    Control_Array(611) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(612) <= (others => 'U');
                else
                    Control_Array(612) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(613) <= (others => 'U');
                else
                    Control_Array(613) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(614) <= (others => 'U');
                else
                    Control_Array(614) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(615) <= (others => 'U');
                else
                    Control_Array(615) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(616) <= (others => 'U');
                else
                    Control_Array(616) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(617) <= (others => 'U');
                else
                    Control_Array(617) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(618) <= (others => 'U');
                else
                    Control_Array(618) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(619) <= (others => 'U');
                else
                    Control_Array(619) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(620) <= (others => 'U');
                else
                    Control_Array(620) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(621) <= (others => 'U');
                else
                    Control_Array(621) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(622) <= (others => 'U');
                else
                    Control_Array(622) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(623) <= (others => 'U');
                else
                    Control_Array(623) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(624) <= (others => 'U');
                else
                    Control_Array(624) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(625) <= (others => 'U');
                else
                    Control_Array(625) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(626) <= (others => 'U');
                else
                    Control_Array(626) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(627) <= (others => 'U');
                else
                    Control_Array(627) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(628) <= (others => 'U');
                else
                    Control_Array(628) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(629) <= (others => 'U');
                else
                    Control_Array(629) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(630) <= (others => 'U');
                else
                    Control_Array(630) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(631) <= (others => 'U');
                else
                    Control_Array(631) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(632) <= (others => 'U');
                else
                    Control_Array(632) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(633) <= (others => 'U');
                else
                    Control_Array(633) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(634) <= (others => 'U');
                else
                    Control_Array(634) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(635) <= (others => 'U');
                else
                    Control_Array(635) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(636) <= (others => 'U');
                else
                    Control_Array(636) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(637) <= (others => 'U');
                else
                    Control_Array(637) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(638) <= (others => 'U');
                else
                    Control_Array(638) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(639) <= (others => 'U');
                else
                    Control_Array(639) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(640) <= (others => 'U');
                else
                    Control_Array(640) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(641) <= (others => 'U');
                else
                    Control_Array(641) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(642) <= (others => 'U');
                else
                    Control_Array(642) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(643) <= (others => 'U');
                else
                    Control_Array(643) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(644) <= (others => 'U');
                else
                    Control_Array(644) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(645) <= (others => 'U');
                else
                    Control_Array(645) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(646) <= (others => 'U');
                else
                    Control_Array(646) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(647) <= (others => 'U');
                else
                    Control_Array(647) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(648) <= (others => 'U');
                else
                    Control_Array(648) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(649) <= (others => 'U');
                else
                    Control_Array(649) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(650) <= (others => 'U');
                else
                    Control_Array(650) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(651) <= (others => 'U');
                else
                    Control_Array(651) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(652) <= (others => 'U');
                else
                    Control_Array(652) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(653) <= (others => 'U');
                else
                    Control_Array(653) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(654) <= (others => 'U');
                else
                    Control_Array(654) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(655) <= (others => 'U');
                else
                    Control_Array(655) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(656) <= (others => 'U');
                else
                    Control_Array(656) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(657) <= (others => 'U');
                else
                    Control_Array(657) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(658) <= (others => 'U');
                else
                    Control_Array(658) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(659) <= (others => 'U');
                else
                    Control_Array(659) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(660) <= (others => 'U');
                else
                    Control_Array(660) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(661) <= (others => 'U');
                else
                    Control_Array(661) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(662) <= (others => 'U');
                else
                    Control_Array(662) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(663) <= (others => 'U');
                else
                    Control_Array(663) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(664) <= (others => 'U');
                else
                    Control_Array(664) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(665) <= (others => 'U');
                else
                    Control_Array(665) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(666) <= (others => 'U');
                else
                    Control_Array(666) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(667) <= (others => 'U');
                else
                    Control_Array(667) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(668) <= (others => 'U');
                else
                    Control_Array(668) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(669) <= (others => 'U');
                else
                    Control_Array(669) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(670) <= (others => 'U');
                else
                    Control_Array(670) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(671) <= (others => 'U');
                else
                    Control_Array(671) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(672) <= (others => 'U');
                else
                    Control_Array(672) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(673) <= (others => 'U');
                else
                    Control_Array(673) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(674) <= (others => 'U');
                else
                    Control_Array(674) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(675) <= (others => 'U');
                else
                    Control_Array(675) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(676) <= (others => 'U');
                else
                    Control_Array(676) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(677) <= (others => 'U');
                else
                    Control_Array(677) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(678) <= (others => 'U');
                else
                    Control_Array(678) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(679) <= (others => 'U');
                else
                    Control_Array(679) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(680) <= (others => 'U');
                else
                    Control_Array(680) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(681) <= (others => 'U');
                else
                    Control_Array(681) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(682) <= (others => 'U');
                else
                    Control_Array(682) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(683) <= (others => 'U');
                else
                    Control_Array(683) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(684) <= (others => 'U');
                else
                    Control_Array(684) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(685) <= (others => 'U');
                else
                    Control_Array(685) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(686) <= (others => 'U');
                else
                    Control_Array(686) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(687) <= (others => 'U');
                else
                    Control_Array(687) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(688) <= (others => 'U');
                else
                    Control_Array(688) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(689) <= (others => 'U');
                else
                    Control_Array(689) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(690) <= (others => 'U');
                else
                    Control_Array(690) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(691) <= (others => 'U');
                else
                    Control_Array(691) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(692) <= (others => 'U');
                else
                    Control_Array(692) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(693) <= (others => 'U');
                else
                    Control_Array(693) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(694) <= (others => 'U');
                else
                    Control_Array(694) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(695) <= (others => 'U');
                else
                    Control_Array(695) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(696) <= (others => 'U');
                else
                    Control_Array(696) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(697) <= (others => 'U');
                else
                    Control_Array(697) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(698) <= (others => 'U');
                else
                    Control_Array(698) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(699) <= (others => 'U');
                else
                    Control_Array(699) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(700) <= (others => 'U');
                else
                    Control_Array(700) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(701) <= (others => 'U');
                else
                    Control_Array(701) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(702) <= (others => 'U');
                else
                    Control_Array(702) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(703) <= (others => 'U');
                else
                    Control_Array(703) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(704) <= (others => 'U');
                else
                    Control_Array(704) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(705) <= (others => 'U');
                else
                    Control_Array(705) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(706) <= (others => 'U');
                else
                    Control_Array(706) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(707) <= (others => 'U');
                else
                    Control_Array(707) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(708) <= (others => 'U');
                else
                    Control_Array(708) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(709) <= (others => 'U');
                else
                    Control_Array(709) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(710) <= (others => 'U');
                else
                    Control_Array(710) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(711) <= (others => 'U');
                else
                    Control_Array(711) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(712) <= (others => 'U');
                else
                    Control_Array(712) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(713) <= (others => 'U');
                else
                    Control_Array(713) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(714) <= (others => 'U');
                else
                    Control_Array(714) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(715) <= (others => 'U');
                else
                    Control_Array(715) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(716) <= (others => 'U');
                else
                    Control_Array(716) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(717) <= (others => 'U');
                else
                    Control_Array(717) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(718) <= (others => 'U');
                else
                    Control_Array(718) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(719) <= (others => 'U');
                else
                    Control_Array(719) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(720) <= (others => 'U');
                else
                    Control_Array(720) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(721) <= (others => 'U');
                else
                    Control_Array(721) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(722) <= (others => 'U');
                else
                    Control_Array(722) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(723) <= (others => 'U');
                else
                    Control_Array(723) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(724) <= (others => 'U');
                else
                    Control_Array(724) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(725) <= (others => 'U');
                else
                    Control_Array(725) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(726) <= (others => 'U');
                else
                    Control_Array(726) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(727) <= (others => 'U');
                else
                    Control_Array(727) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(728) <= (others => 'U');
                else
                    Control_Array(728) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(729) <= (others => 'U');
                else
                    Control_Array(729) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(730) <= (others => 'U');
                else
                    Control_Array(730) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(731) <= (others => 'U');
                else
                    Control_Array(731) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(732) <= (others => 'U');
                else
                    Control_Array(732) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(733) <= (others => 'U');
                else
                    Control_Array(733) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(734) <= (others => 'U');
                else
                    Control_Array(734) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(735) <= (others => 'U');
                else
                    Control_Array(735) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(736) <= (others => 'U');
                else
                    Control_Array(736) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(737) <= (others => 'U');
                else
                    Control_Array(737) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(738) <= (others => 'U');
                else
                    Control_Array(738) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(739) <= (others => 'U');
                else
                    Control_Array(739) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(740) <= (others => 'U');
                else
                    Control_Array(740) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(741) <= (others => 'U');
                else
                    Control_Array(741) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(742) <= (others => 'U');
                else
                    Control_Array(742) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(743) <= (others => 'U');
                else
                    Control_Array(743) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(744) <= (others => 'U');
                else
                    Control_Array(744) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(745) <= (others => 'U');
                else
                    Control_Array(745) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(746) <= (others => 'U');
                else
                    Control_Array(746) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(747) <= (others => 'U');
                else
                    Control_Array(747) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(748) <= (others => 'U');
                else
                    Control_Array(748) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(749) <= (others => 'U');
                else
                    Control_Array(749) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(750) <= (others => 'U');
                else
                    Control_Array(750) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(751) <= (others => 'U');
                else
                    Control_Array(751) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(752) <= (others => 'U');
                else
                    Control_Array(752) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(753) <= (others => 'U');
                else
                    Control_Array(753) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(754) <= (others => 'U');
                else
                    Control_Array(754) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(755) <= (others => 'U');
                else
                    Control_Array(755) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(756) <= (others => 'U');
                else
                    Control_Array(756) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(757) <= (others => 'U');
                else
                    Control_Array(757) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(758) <= (others => 'U');
                else
                    Control_Array(758) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(759) <= (others => 'U');
                else
                    Control_Array(759) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(760) <= (others => 'U');
                else
                    Control_Array(760) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(761) <= (others => 'U');
                else
                    Control_Array(761) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(762) <= (others => 'U');
                else
                    Control_Array(762) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(763) <= (others => 'U');
                else
                    Control_Array(763) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(764) <= (others => 'U');
                else
                    Control_Array(764) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(765) <= (others => 'U');
                else
                    Control_Array(765) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(766) <= (others => 'U');
                else
                    Control_Array(766) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(767) <= (others => 'U');
                else
                    Control_Array(767) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(768) <= (others => 'U');
                else
                    Control_Array(768) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(769) <= (others => 'U');
                else
                    Control_Array(769) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(770) <= (others => 'U');
                else
                    Control_Array(770) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(771) <= (others => 'U');
                else
                    Control_Array(771) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(772) <= (others => 'U');
                else
                    Control_Array(772) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(773) <= (others => 'U');
                else
                    Control_Array(773) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(774) <= (others => 'U');
                else
                    Control_Array(774) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(775) <= (others => 'U');
                else
                    Control_Array(775) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(776) <= (others => 'U');
                else
                    Control_Array(776) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(777) <= (others => 'U');
                else
                    Control_Array(777) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(778) <= (others => 'U');
                else
                    Control_Array(778) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(779) <= (others => 'U');
                else
                    Control_Array(779) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(780) <= (others => 'U');
                else
                    Control_Array(780) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(781) <= (others => 'U');
                else
                    Control_Array(781) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(782) <= (others => 'U');
                else
                    Control_Array(782) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(783) <= (others => 'U');
                else
                    Control_Array(783) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(784) <= (others => 'U');
                else
                    Control_Array(784) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(785) <= (others => 'U');
                else
                    Control_Array(785) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(786) <= (others => 'U');
                else
                    Control_Array(786) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(787) <= (others => 'U');
                else
                    Control_Array(787) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(788) <= (others => 'U');
                else
                    Control_Array(788) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(789) <= (others => 'U');
                else
                    Control_Array(789) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(790) <= (others => 'U');
                else
                    Control_Array(790) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(791) <= (others => 'U');
                else
                    Control_Array(791) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(792) <= (others => 'U');
                else
                    Control_Array(792) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(793) <= (others => 'U');
                else
                    Control_Array(793) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(794) <= (others => 'U');
                else
                    Control_Array(794) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(795) <= (others => 'U');
                else
                    Control_Array(795) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(796) <= (others => 'U');
                else
                    Control_Array(796) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(797) <= (others => 'U');
                else
                    Control_Array(797) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(798) <= (others => 'U');
                else
                    Control_Array(798) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(799) <= (others => 'U');
                else
                    Control_Array(799) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(800) <= (others => 'U');
                else
                    Control_Array(800) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(801) <= (others => 'U');
                else
                    Control_Array(801) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(802) <= (others => 'U');
                else
                    Control_Array(802) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(803) <= (others => 'U');
                else
                    Control_Array(803) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(804) <= (others => 'U');
                else
                    Control_Array(804) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(805) <= (others => 'U');
                else
                    Control_Array(805) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(806) <= (others => 'U');
                else
                    Control_Array(806) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(807) <= (others => 'U');
                else
                    Control_Array(807) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(808) <= (others => 'U');
                else
                    Control_Array(808) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(809) <= (others => 'U');
                else
                    Control_Array(809) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(810) <= (others => 'U');
                else
                    Control_Array(810) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(811) <= (others => 'U');
                else
                    Control_Array(811) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(812) <= (others => 'U');
                else
                    Control_Array(812) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(813) <= (others => 'U');
                else
                    Control_Array(813) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(814) <= (others => 'U');
                else
                    Control_Array(814) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(815) <= (others => 'U');
                else
                    Control_Array(815) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(816) <= (others => 'U');
                else
                    Control_Array(816) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(817) <= (others => 'U');
                else
                    Control_Array(817) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(818) <= (others => 'U');
                else
                    Control_Array(818) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(819) <= (others => 'U');
                else
                    Control_Array(819) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(820) <= (others => 'U');
                else
                    Control_Array(820) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(821) <= (others => 'U');
                else
                    Control_Array(821) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(822) <= (others => 'U');
                else
                    Control_Array(822) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(823) <= (others => 'U');
                else
                    Control_Array(823) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(824) <= (others => 'U');
                else
                    Control_Array(824) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(825) <= (others => 'U');
                else
                    Control_Array(825) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(826) <= (others => 'U');
                else
                    Control_Array(826) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(827) <= (others => 'U');
                else
                    Control_Array(827) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(828) <= (others => 'U');
                else
                    Control_Array(828) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(829) <= (others => 'U');
                else
                    Control_Array(829) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(830) <= (others => 'U');
                else
                    Control_Array(830) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(831) <= (others => 'U');
                else
                    Control_Array(831) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(832) <= (others => 'U');
                else
                    Control_Array(832) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(833) <= (others => 'U');
                else
                    Control_Array(833) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(834) <= (others => 'U');
                else
                    Control_Array(834) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(835) <= (others => 'U');
                else
                    Control_Array(835) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(836) <= (others => 'U');
                else
                    Control_Array(836) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(837) <= (others => 'U');
                else
                    Control_Array(837) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(838) <= (others => 'U');
                else
                    Control_Array(838) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(839) <= (others => 'U');
                else
                    Control_Array(839) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(840) <= (others => 'U');
                else
                    Control_Array(840) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(841) <= (others => 'U');
                else
                    Control_Array(841) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(842) <= (others => 'U');
                else
                    Control_Array(842) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(843) <= (others => 'U');
                else
                    Control_Array(843) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(844) <= (others => 'U');
                else
                    Control_Array(844) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(845) <= (others => 'U');
                else
                    Control_Array(845) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(846) <= (others => 'U');
                else
                    Control_Array(846) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(847) <= (others => 'U');
                else
                    Control_Array(847) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(848) <= (others => 'U');
                else
                    Control_Array(848) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(849) <= (others => 'U');
                else
                    Control_Array(849) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(850) <= (others => 'U');
                else
                    Control_Array(850) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(851) <= (others => 'U');
                else
                    Control_Array(851) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(852) <= (others => 'U');
                else
                    Control_Array(852) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(853) <= (others => 'U');
                else
                    Control_Array(853) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(854) <= (others => 'U');
                else
                    Control_Array(854) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(855) <= (others => 'U');
                else
                    Control_Array(855) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(856) <= (others => 'U');
                else
                    Control_Array(856) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(857) <= (others => 'U');
                else
                    Control_Array(857) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(858) <= (others => 'U');
                else
                    Control_Array(858) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(859) <= (others => 'U');
                else
                    Control_Array(859) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(860) <= (others => 'U');
                else
                    Control_Array(860) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(861) <= (others => 'U');
                else
                    Control_Array(861) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(862) <= (others => 'U');
                else
                    Control_Array(862) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(863) <= (others => 'U');
                else
                    Control_Array(863) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(864) <= (others => 'U');
                else
                    Control_Array(864) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(865) <= (others => 'U');
                else
                    Control_Array(865) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(866) <= (others => 'U');
                else
                    Control_Array(866) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(867) <= (others => 'U');
                else
                    Control_Array(867) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(868) <= (others => 'U');
                else
                    Control_Array(868) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(869) <= (others => 'U');
                else
                    Control_Array(869) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(870) <= (others => 'U');
                else
                    Control_Array(870) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(871) <= (others => 'U');
                else
                    Control_Array(871) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(872) <= (others => 'U');
                else
                    Control_Array(872) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(873) <= (others => 'U');
                else
                    Control_Array(873) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(874) <= (others => 'U');
                else
                    Control_Array(874) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(875) <= (others => 'U');
                else
                    Control_Array(875) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(876) <= (others => 'U');
                else
                    Control_Array(876) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(877) <= (others => 'U');
                else
                    Control_Array(877) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(878) <= (others => 'U');
                else
                    Control_Array(878) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(879) <= (others => 'U');
                else
                    Control_Array(879) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(880) <= (others => 'U');
                else
                    Control_Array(880) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(881) <= (others => 'U');
                else
                    Control_Array(881) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(882) <= (others => 'U');
                else
                    Control_Array(882) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(883) <= (others => 'U');
                else
                    Control_Array(883) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(884) <= (others => 'U');
                else
                    Control_Array(884) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(885) <= (others => 'U');
                else
                    Control_Array(885) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(886) <= (others => 'U');
                else
                    Control_Array(886) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(887) <= (others => 'U');
                else
                    Control_Array(887) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(888) <= (others => 'U');
                else
                    Control_Array(888) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(889) <= (others => 'U');
                else
                    Control_Array(889) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(890) <= (others => 'U');
                else
                    Control_Array(890) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(891) <= (others => 'U');
                else
                    Control_Array(891) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(892) <= (others => 'U');
                else
                    Control_Array(892) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(893) <= (others => 'U');
                else
                    Control_Array(893) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(894) <= (others => 'U');
                else
                    Control_Array(894) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(895) <= (others => 'U');
                else
                    Control_Array(895) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(896) <= (others => 'U');
                else
                    Control_Array(896) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(897) <= (others => 'U');
                else
                    Control_Array(897) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(898) <= (others => 'U');
                else
                    Control_Array(898) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(899) <= (others => 'U');
                else
                    Control_Array(899) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(900) <= (others => 'U');
                else
                    Control_Array(900) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(901) <= (others => 'U');
                else
                    Control_Array(901) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(902) <= (others => 'U');
                else
                    Control_Array(902) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(903) <= (others => 'U');
                else
                    Control_Array(903) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(904) <= (others => 'U');
                else
                    Control_Array(904) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(905) <= (others => 'U');
                else
                    Control_Array(905) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(906) <= (others => 'U');
                else
                    Control_Array(906) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(907) <= (others => 'U');
                else
                    Control_Array(907) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(908) <= (others => 'U');
                else
                    Control_Array(908) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(909) <= (others => 'U');
                else
                    Control_Array(909) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(910) <= (others => 'U');
                else
                    Control_Array(910) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(911) <= (others => 'U');
                else
                    Control_Array(911) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(912) <= (others => 'U');
                else
                    Control_Array(912) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(913) <= (others => 'U');
                else
                    Control_Array(913) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(914) <= (others => 'U');
                else
                    Control_Array(914) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(915) <= (others => 'U');
                else
                    Control_Array(915) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(916) <= (others => 'U');
                else
                    Control_Array(916) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(917) <= (others => 'U');
                else
                    Control_Array(917) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(918) <= (others => 'U');
                else
                    Control_Array(918) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(919) <= (others => 'U');
                else
                    Control_Array(919) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(920) <= (others => 'U');
                else
                    Control_Array(920) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(921) <= (others => 'U');
                else
                    Control_Array(921) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(922) <= (others => 'U');
                else
                    Control_Array(922) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(923) <= (others => 'U');
                else
                    Control_Array(923) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(924) <= (others => 'U');
                else
                    Control_Array(924) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(925) <= (others => 'U');
                else
                    Control_Array(925) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(926) <= (others => 'U');
                else
                    Control_Array(926) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(927) <= (others => 'U');
                else
                    Control_Array(927) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(928) <= (others => 'U');
                else
                    Control_Array(928) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(929) <= (others => 'U');
                else
                    Control_Array(929) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(930) <= (others => 'U');
                else
                    Control_Array(930) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(931) <= (others => 'U');
                else
                    Control_Array(931) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(932) <= (others => 'U');
                else
                    Control_Array(932) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(933) <= (others => 'U');
                else
                    Control_Array(933) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(934) <= (others => 'U');
                else
                    Control_Array(934) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(935) <= (others => 'U');
                else
                    Control_Array(935) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(936) <= (others => 'U');
                else
                    Control_Array(936) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(937) <= (others => 'U');
                else
                    Control_Array(937) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(938) <= (others => 'U');
                else
                    Control_Array(938) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(939) <= (others => 'U');
                else
                    Control_Array(939) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(940) <= (others => 'U');
                else
                    Control_Array(940) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(941) <= (others => 'U');
                else
                    Control_Array(941) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(942) <= (others => 'U');
                else
                    Control_Array(942) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(943) <= (others => 'U');
                else
                    Control_Array(943) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(944) <= (others => 'U');
                else
                    Control_Array(944) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(945) <= (others => 'U');
                else
                    Control_Array(945) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(946) <= (others => 'U');
                else
                    Control_Array(946) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(947) <= (others => 'U');
                else
                    Control_Array(947) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(948) <= (others => 'U');
                else
                    Control_Array(948) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(949) <= (others => 'U');
                else
                    Control_Array(949) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(950) <= (others => 'U');
                else
                    Control_Array(950) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(951) <= (others => 'U');
                else
                    Control_Array(951) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(952) <= (others => 'U');
                else
                    Control_Array(952) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(953) <= (others => 'U');
                else
                    Control_Array(953) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(954) <= (others => 'U');
                else
                    Control_Array(954) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(955) <= (others => 'U');
                else
                    Control_Array(955) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(956) <= (others => 'U');
                else
                    Control_Array(956) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(957) <= (others => 'U');
                else
                    Control_Array(957) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(958) <= (others => 'U');
                else
                    Control_Array(958) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(959) <= (others => 'U');
                else
                    Control_Array(959) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(960) <= (others => 'U');
                else
                    Control_Array(960) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(961) <= (others => 'U');
                else
                    Control_Array(961) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(962) <= (others => 'U');
                else
                    Control_Array(962) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(963) <= (others => 'U');
                else
                    Control_Array(963) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(964) <= (others => 'U');
                else
                    Control_Array(964) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(965) <= (others => 'U');
                else
                    Control_Array(965) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(966) <= (others => 'U');
                else
                    Control_Array(966) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(967) <= (others => 'U');
                else
                    Control_Array(967) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(968) <= (others => 'U');
                else
                    Control_Array(968) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(969) <= (others => 'U');
                else
                    Control_Array(969) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(970) <= (others => 'U');
                else
                    Control_Array(970) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(971) <= (others => 'U');
                else
                    Control_Array(971) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(972) <= (others => 'U');
                else
                    Control_Array(972) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(973) <= (others => 'U');
                else
                    Control_Array(973) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(974) <= (others => 'U');
                else
                    Control_Array(974) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(975) <= (others => 'U');
                else
                    Control_Array(975) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(976) <= (others => 'U');
                else
                    Control_Array(976) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(977) <= (others => 'U');
                else
                    Control_Array(977) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(978) <= (others => 'U');
                else
                    Control_Array(978) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(979) <= (others => 'U');
                else
                    Control_Array(979) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(980) <= (others => 'U');
                else
                    Control_Array(980) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(981) <= (others => 'U');
                else
                    Control_Array(981) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(982) <= (others => 'U');
                else
                    Control_Array(982) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(983) <= (others => 'U');
                else
                    Control_Array(983) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(984) <= (others => 'U');
                else
                    Control_Array(984) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(985) <= (others => 'U');
                else
                    Control_Array(985) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(986) <= (others => 'U');
                else
                    Control_Array(986) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(987) <= (others => 'U');
                else
                    Control_Array(987) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(988) <= (others => 'U');
                else
                    Control_Array(988) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(989) <= (others => 'U');
                else
                    Control_Array(989) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(990) <= (others => 'U');
                else
                    Control_Array(990) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(991) <= (others => 'U');
                else
                    Control_Array(991) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(992) <= (others => 'U');
                else
                    Control_Array(992) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(993) <= (others => 'U');
                else
                    Control_Array(993) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(994) <= (others => 'U');
                else
                    Control_Array(994) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(995) <= (others => 'U');
                else
                    Control_Array(995) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(996) <= (others => 'U');
                else
                    Control_Array(996) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(997) <= (others => 'U');
                else
                    Control_Array(997) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(998) <= (others => 'U');
                else
                    Control_Array(998) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Array(999) <= (others => 'U');
                else
                    Control_Array(999) <= unsigned(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Length <= (others => 'U');
                else
                    Control_Length <= signed(to_std_logic_vector(truncate(tmp)));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Reset <= 'U';
                else
                    Control_Reset <= to_std_logic(truncate(tmp));
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if are_strings_equal(tmp, "U") then
                    Control_Valid <= 'U';
                else
                    Control_Valid <= to_std_logic(truncate(tmp));
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
                    if not are_strings_equal(str(Traversal_Valid), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for Traversal_Valid in cycle " & integer'image(clockcycle) & " was: " & str(Traversal_Valid) & " but should have been: " & truncate(tmp) severity Error;
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