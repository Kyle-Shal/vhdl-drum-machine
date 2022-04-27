library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity audio_config is
port( busy_flag: out std_logic;
sclk: out std_logic;
send_flag: in std_logic;
sdin: inout std_logic;
done_flag: out std_logic;
data_in: in std_logic_vector(15 downto 0);
clock_50_in: in std_logic );
end audio_config;

architecture logic of audio_config is

signal aud_codec_address: std_logic_vector (7 downto 0) := "00110100";
signal sclk_en: std_logic:='0';
signal clk_counter: integer range 0 to 300:=0;
signal clk_en: std_logic:='0';
signal ack_en: std_logic:='0';
signal sclk_int: std_logic:='0';
signal get_ack: std_logic:='0';
signal bit_index: integer range 0 to 15:=0;
type state is (st0,st1,st2,st3,st4,st5,st6,st7,st8);
signal current_state:state:=st0;
begin


process(clock_50_in)
begin

if rising_edge(clock_50_in) then

	if(clk_counter<250)then --- generating clk for sclk
		clk_counter<=clk_counter+1;
		else
		clk_counter<=0;
	end if;
	
	if(clk_counter<125)then 
		sclk_int<='1';
		else
		sclk_int<='0';
	end if;
	
	if(clk_counter=62)then 
		ack_en<='1';
		else
		ack_en<='0';
	end if;
	
	if(clk_counter=187)then 
		clk_en<='1';
		else
		clk_en<='0';
	end if;
	
end if;

if rising_edge(clock_50_in) then

	if(sclk_en='1')then
		sclk<=sclk_int;
	else 
		sclk<='1';
	end if;
	
	if(ack_en='1')then
		case current_state is
		when st3=>
				if(sdin='0')then
					current_state<=st4; --- go to next state to send first 8 bits
					bit_index<=15;	
					else
					sclk_en<='0';
					current_state<=st0; --- reset to IDLE state
				end if;
				
		when st5=>
				if(sdin='0')then
					current_state<=st6; --- go to next state to send second 8 bits
					bit_index<=7;			

					else
					current_state<=st0; --- reset to IDLE state
					sclk_en<='0';
				end if;
				
		when st7 =>
				if(sdin='0')then --- check stop condition
					current_state<=st8; --- stop condition true
					else
					current_state<=st0; --- reset to IDLE state
					sclk_en<='0';
				end if;	
	   when others=>NULL;
		end case;
	end if;
	
	
	if(clk_en='1')then
		case current_state is
			when st0=> --- IDLE state
				sdin<='1';
				busy_flag<='0';
				done_flag<='0';
				if(send_flag='1')then
					current_state<=st1;
					busy_flag<='1';
				end if;
				
			when st1=> --- sdin goes to low while bclk is high to trigger start condition
				sdin<='0';
				current_state<=st2;
				bit_index<=7;
			when st2=> --- send the address of the audio codec 00110100
			   sclk_en<='1';
				if(bit_index>0) then
					bit_index<=bit_index-1;
					sdin<=aud_codec_address(bit_index);
				else
					sdin<=aud_codec_address(bit_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					current_state<=st3;
					sdin<='Z';
				end if;
				
			when st4=> --- send first 8 bits
			
				if(bit_index>8) then
					bit_index<=bit_index-1;
					sdin<=data_in(bit_index);
				else
					sdin<=data_in(bit_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					current_state<=st5;
					sdin<='Z';				
				end if;
				
			when st6 => --- send second 8 bits
			
				if(bit_index>0) then
					bit_index<=bit_index-1;
					sdin<=data_in(bit_index);
				else
					sdin<=data_in(bit_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					current_state<=st7;
					sdin<='Z';
				end if;
				
			when st8 => --- reset flags and return to IDLE state
				sclk_en<='0';
				sdin<='0';
				current_state<=st0;
				done_flag<='1';
			when others=>NULL;
			end case;
	end if;
end if;
end process;
end logic;