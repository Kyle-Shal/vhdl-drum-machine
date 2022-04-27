library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity audio_data is
port (clock_12: in std_logic;
	bclk: out std_logic;
	daclr: out std_logic;
	dacdat: out std_logic;
	data_in: in std_logic_vector(31 downto 0));
end audio_data;

architecture logic of audio_data is

signal sending_sample: std_logic:='0';
signal bit_index: integer range 0 to 31:=0;
signal data_out: std_logic_vector(31 downto 0):=(others=>'0');
signal sampling_counter: integer range 0 to 300:=0;
signal clk_en: std_logic:='0';
begin

bclk<=clock_12; --- Connect 12 MHz clock to BCLK

process(clock_12)
begin

if falling_edge(clock_12) then

	daclr<=clk_en;

	if(sampling_counter<250)then ---48 kHz sampling rate 250 / 44.28 kHz sampling rate 271
		sampling_counter <= sampling_counter + 1;
		clk_en<='0';
		else
		sampling_counter<=0;
		data_out<=data_in;
		clk_en<='1';
		sending_sample<='1';
		bit_index<=31;
	end if;

	if(sending_sample='1')then --- start sending data sampling from MSB with every clock edge
		if(bit_index>0)then
			dacdat<=data_out(bit_index);
			bit_index<=bit_index-1;
			else 
			dacdat<=data_out(bit_index);
			sending_sample<='0';
		end if;
	end if;
end if;

end process;
end logic;