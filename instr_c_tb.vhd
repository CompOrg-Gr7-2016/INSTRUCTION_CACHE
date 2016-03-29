library IEEE;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.numeric_std.all; -- allows use of the unsigned type
use STD.textio.all;

entity instr_c_tb is
  port (
    clock : std_logic
  );
end entity;

architecture b of instr_c_tb is

    component INSTRUCTION_CACHE IS
       GENERIC (
          instruction_file    : STRING    := "C:\\Users\\Francis\\Dropbox\\School\\2016 - Winter\\Computer Architecture\\Project Folder\\Instruction Cache\\Init.dat";
          instr_c_size_in_bytes     : INTEGER   := 256
       );
       PORT (
          clk : IN STD_LOGIC;
          address : IN std_logic_vector(31 downto 0);
          instruction : out std_logic_vector(31 downto 0)
       );
    END component;

    signal clk : STD_LOGIC := '0';
    signal address : std_logic_vector(31 downto 0) := x"00000000";
    signal instruction : std_logic_vector(31 downto 0);
begin

    i1 : INSTRUCTION_CACHE port map(
        clk => clk,
        address => address,
        instruction => instruction
    );

    clk <= not clk after 10 ns;

    identifier : process(clk)
    begin
        if falling_edge(clk) then
            address <= std_logic_vector(to_unsigned(to_integer(unsigned(address)) + 4, 32));
        end if;
    end process;

end architecture;
