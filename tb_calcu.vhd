----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/04/2021 12:56:49 PM
-- Design Name: 
-- Module Name: tb_calcu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_calcu is
--  Port ( );
end tb_calcu;

architecture Behavioral of tb_calcu is
component Calcu is
    Port (a: in std_logic_vector (7 downto 0);
          b: in std_logic_vector (7 downto 0);
          selector: in std_logic_vector (2 downto 0);
          respuesta: out std_logic_vector (7 downto 0);
          magnitud: out std_logic_vector (7 downto 0);
          neg: out std_logic);
end component;

signal a_s: std_logic_vector (7 downto 0):="00000000";
signal b_s: std_logic_vector (7 downto 0):="00000000";
signal selector_S: std_logic_vector (2 downto 0):="000";
signal respuesta_s: std_logic_vector (7 downto 0);
signal magnitud_s: std_logic_vector (7 downto 0);
signal neg_s: std_logic;

begin

DUT: Calcu port map(
    a => a_s,
    b => b_s,
    selector => selector_s,
    respuesta => respuesta_s,
    magnitud => magnitud_s,
    neg => neg_s);
    
process
begin
    ----- 5 + 3 -----
    wait for 10 ns;
    a_s <= "00000101";
    b_s <= "00000011";
    
    wait for 2 ns;
    selector_s <= "001";
    wait for 190 ns;
    selector_s <= "000";
    ----- 9 - 4 -----
    wait for 100 ns;
    a_s <= "00001001";
    b_s <= "00000100";
    
    wait for 2 ns;
    selector_s <= "010";
    wait for 190 ns;
    selector_s <= "000";
    ----- 5 * 3 -----
    wait for 100 ns;
    a_s <= "00000101";
    b_s <= "00000011";
        
    wait for 2 ns;
    selector_s <= "100";
    wait for 190 ns;
    selector_s <= "000";
    ----- -8 + -5 -----
    wait for 100 ns;
    a_s <= "11111000";
    b_s <= "11111011";
            
    wait for 2 ns;
    selector_s <= "001";
    wait for 190 ns;
    selector_s <= "000";
    ----- 6 * -2 -----
    wait for 100 ns;
    a_s <= "00000110";
    b_s <= "11111110";
                
    wait for 2 ns;
    selector_s <= "100";
    wait for 190 ns;
    selector_s <= "000";
     
wait;
end process;
end Behavioral;
