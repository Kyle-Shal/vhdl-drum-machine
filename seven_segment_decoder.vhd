library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seven_segment_decoder is
	port(input: in std_logic_vector(4 downto 0);
		  output: out std_logic_vector(6 downto 0));
end seven_segment_decoder;

architecture logic of seven_segment_decoder is
begin
	with input select
	output <= "1000000" when "00000",--- 0
					"1111001" when "00001", --- 1
					"0100100" when "00010", --- 2
					"0110000" when "00011", --- 3
					"0011001" when "00100", --- 4
					"0001000" when "00101", --- A
					"0000011" when "00110", --- b
					"0100111" when "00111", --- c
					"0100001" when "01000", --- d
					"0000110" when "01001", --- E
					"0001001" when "01010", --- H
					"1001111" when "01011", --- I
					"1001000" when "01100", --- M
					"0101011" when "01101", --- n
					"0001100" when "01110", --- P
					"0101111" when "01111", --- r
					"0010010" when "10000", --- S
					"0000111" when "10001", --- t
					"1100011" when "10010", --- u
					"1000001" when "10011", --- V
					"1000111" when "10100", --- L
					"1111111" when others;
end logic;