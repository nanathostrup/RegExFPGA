all: test export
testbench: sme_intro_tb
export: sme_intro_export
build: export testbench

# Use a temporary folder for compiled stuff
WORKDIR=work

# All code should be VHDL93 compliant,
# but 93c is a bit easier to work with
STD=93c

# Eveything should compile with clean IEEE,
# but the test-bench and CSV util's require
# std_logic_textio from Synopsys
IEEE=synopsys

ifndef SME_TEST_SKIP_VCD
# VCD trace file for GTKWave
VCDFILE=trace.vcd
VCDFLAG=--vcd=$(VCDFILE)
endif

# Disable the 'Warning: redundant others'
FLAGS=--warn-no-others

$(WORKDIR):
	mkdir $(WORKDIR)

$(WORKDIR)/system_types.o: system_types.vhdl $(WORKDIR)
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) system_types.vhdl

$(WORKDIR)/Types_sme_intro.o: Types_sme_intro.vhdl $(WORKDIR)
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) Types_sme_intro.vhdl

$(WORKDIR)/Counter.o: Counter.vhdl $(WORKDIR)/system_types.o $(WORKDIR)/Types_sme_intro.o $(WORKDIR)
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) Counter.vhdl

$(WORKDIR)/csv_util.o: csv_util.vhdl $(WORKDIR)/system_types.o $(WORKDIR)/Types_sme_intro.o $(WORKDIR)
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) csv_util.vhdl

$(WORKDIR)/sme_intro.o: sme_intro.vhdl $(WORKDIR)/system_types.o $(WORKDIR)/Types_sme_intro.o $(WORKDIR)/Counter.o $(WORKDIR)/csv_util.o 
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) sme_intro.vhdl

$(WORKDIR)/TestBench_sme_intro.o: TestBench_sme_intro.vhdl $(WORKDIR)/sme_intro.o
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) TestBench_sme_intro.vhdl

sme_intro_tb: $(WORKDIR)/TestBench_sme_intro.o
	ghdl -e --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) sme_intro_tb

sme_intro_export: $(WORKDIR)/sme_intro.o
	ghdl -a --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) Export_sme_intro.vhdl

test: sme_intro_tb
	ghdl -r --std=$(STD) --ieee=$(IEEE) --workdir=$(WORKDIR) $(FLAGS) sme_intro_tb $(VCDFLAG)

clean:
	rm -rf $(WORKDIR) *.o sme_intro_tb

.PHONY: all clean test export build 
