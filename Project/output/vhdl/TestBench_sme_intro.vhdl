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

    signal Control_Character : T_SYSTEM_UINT8;
    signal Control_Reset : T_SYSTEM_BOOL;
    signal Control_Valid : T_SYSTEM_BOOL;
    signal Count_CompareCharacter : T_SYSTEM_UINT32;
    signal Count_Count : T_SYSTEM_UINT32;
    signal OrCounter_Comparison0 : T_SYSTEM_UINT32;
    signal OrCounter_Comparison1 : T_SYSTEM_UINT32;
    signal OrCounter_Counter : T_SYSTEM_UINT32;
    signal OrCounter_Status : T_SYSTEM_BOOL;

begin

    uut: entity work.sme_intro
    port map (
        Control_Valid => Control_Valid,
        Control_Reset => Control_Reset,
        Control_Character => Control_Character,
        Count_Count => Count_Count,
        Count_CompareCharacter => Count_CompareCharacter,
        OrCounter_Counter => OrCounter_Counter,
        OrCounter_Comparison0 => OrCounter_Comparison0,
        OrCounter_Comparison1 => OrCounter_Comparison1,
        OrCounter_Status => OrCounter_Status,

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
            assert are_strings_equal(tmp, "Control.Character") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Character" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Reset") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Reset" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Control.Valid") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Control.Valid" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Count.CompareCharacter") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Count.CompareCharacter" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "Count.Count") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected Count.Count" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "OrCounter.Comparison0") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OrCounter.Comparison0" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "OrCounter.Comparison1") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OrCounter.Comparison1" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "OrCounter.Counter") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OrCounter.Counter" severity Failure;
            fieldno := fieldno + 1;
            read_csv_field(L, tmp);
            assert are_strings_equal(tmp, "OrCounter.Status") report "Field #" & integer'image(fieldno) & " is not correctly named: " & truncate(tmp) & ", expected OrCounter.Status" severity Failure;
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
                    Control_Character <= (others => 'U');
                else
                    Control_Character <= unsigned(to_std_logic_vector(truncate(tmp)));
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
                    if not are_strings_equal(str(Count_CompareCharacter), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for Count_CompareCharacter in cycle " & integer'image(clockcycle) & " was: " & str(Count_CompareCharacter) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(Count_Count), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for Count_Count in cycle " & integer'image(clockcycle) & " was: " & str(Count_Count) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(OrCounter_Comparison0), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for OrCounter_Comparison0 in cycle " & integer'image(clockcycle) & " was: " & str(OrCounter_Comparison0) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(OrCounter_Comparison1), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for OrCounter_Comparison1 in cycle " & integer'image(clockcycle) & " was: " & str(OrCounter_Comparison1) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(OrCounter_Counter), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for OrCounter_Counter in cycle " & integer'image(clockcycle) & " was: " & str(OrCounter_Counter) & " but should have been: " & truncate(tmp) severity Error;
                    end if;
                end if;
                fieldno := fieldno + 1;
                read_csv_field(L, tmp);
                if not are_strings_equal(tmp, "U") then
                    if not are_strings_equal(str(OrCounter_Status), tmp) then
                        newfailures := newfailures + 1;
                        report "Value for OrCounter_Status in cycle " & integer'image(clockcycle) & " was: " & str(OrCounter_Status) & " but should have been: " & truncate(tmp) severity Error;
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