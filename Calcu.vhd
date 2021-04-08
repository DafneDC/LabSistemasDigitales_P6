----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/04/2021 12:20:22 PM
-- Design Name: 
-- Module Name: Calcu - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Calcu is
port(
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    selector: in std_logic_vector (2 downto 0);
    respuesta: out std_logic_vector (7 downto 0);
    magnitud: out std_logic_vector (7 downto 0);
    neg: out std_logic);
end Calcu;

architecture Behavioral of Calcu is
signal auxR: std_logic_vector (7 downto 0):="00000000";
signal tmp: std_logic_vector (7 downto 0):="00000000";

begin
    process (a, b, selector)
    begin
        case(selector) is
        when "001" => auxR <=a + b;
        when "010" => auxR <=a - b;
        when "100" => auxR <=std_logic_vector(to_unsigned(to_integer(unsigned(a))*to_integer(unsigned(b)), 8));
        when others => auxR <= auxR;
        end case;             
    end process;
    
    process (auxR)
    begin
        if(auxR(7)='1') then tmp <= (auxR xor "11111111") + 1; neg <= '1';
        else tmp <= auxR; neg <= '0';
        end if; 
    end process;
    
    respuesta <= auxR;
    magnitud <= tmp;
    
end Behavioral;
