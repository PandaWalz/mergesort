library verilog;
use verilog.vl_types.all;
entity mergesort is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        registers_in    : in     vl_logic;
        mergelist_out   : out    vl_logic_vector(31 downto 0)
    );
end mergesort;
