-------------------------------------------------------------------------
-- Fifo.vhd
--
-- Author: Elias Geissler
-- Project: SSL1 Master ESD at FH Hagenberg
-------------------------------------------------------------------------
-- Description: simple generic fifo

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.pkgGlobal.all;

entity Fifo is
	generic (
		gFifoWidth	: natural	:= 8;
		gFifoStages	: natural	:= 8
	);
	port(
		iClk 		: in std_ulogic;
		inRstAsync 	: in std_ulogic;
		
		iFifoData		: in  std_ulogic_vector(gFifoWidth-1 downto 0);
		oFifoData		: out std_ulogic_vector(gFifoWidth-1 downto 0);
		iFifoShift		: in  std_ulogic;
		iFifoWrite		: in  std_ulogic;
		oFifoEmpty		: out std_ulogic;
		oFifoFull		: out std_ulogic
	);
end entity Fifo;

architecture RTL of Fifo is
	
	type tFifo is array (0 to gFifoStages-1) of std_ulogic_vector(gFifoWidth-1 downto 0);
	signal Fifo : tFifo := (others => (others => '1'));
	
	signal Read		: natural range 0 to gFifoStages-1;
	signal Write	: natural range 0 to gFifoStages-1;
	
begin
	
	Reg: process (iClk, inRstAsync) is		
	begin
		
		if inRstAsync = cnActivated then
			Read 	<= 0;
			Write 	<= 0;
			
			oFifoEmpty 	<= '0';
			oFifoFull  	<= '0';
			
		elsif rising_edge(iClk) then
			
			-- read data
			if Read = Write then -- if empty
				-- read last valid data
				if Read = 0 then
					oFifoData <= Fifo(gFifoStages-1);
				else
					oFifoData <= Fifo(Read-1);
				end if;
			else	
				-- else normal read
				oFifoData <= Fifo(Read);
			end if;
			
			-- write access
			if iFifoWrite = cActivated then
				-- overwrite data if fifo is full
				if  (Write+1 = Read) or							-- write stand one before read
					(Write = gFifoStages-1 and Read = 0) then	-- write stand one before read but over the edge of the ringbuffer
					
					Fifo(Write) <= iFifoData;
					-- change write address
					if Write + 1 < gFifoStages then
						Write <= Write + 1;
					else
						Write <= Write + 1 - gFifoStages;
					end if;
					
					-- change read address
					if Read + 1 < gFifoStages then
						Read <= Read + 1;
					else
						Read <= Read + 1 - gFifoStages;
					end if;
					
				else
					
					Fifo(Write) <= iFifoData;
					
					-- change write address
					if Write + 1 < gFifoStages then
						Write <= Write + 1;
					else
						Write <= Write + 1 - gFifoStages;
					end if;
				end if;
			end if;
			
			if iFifoShift = cActivated then 
				
				-- Read = Write means empty fifo
				if Read /= Write then
					-- change read address
					if Read + 1 < gFifoStages then
						Read <= Read + 1;
					else
						Read <= Read + 1 - gFifoStages;
					end if;
				end if;
			end if;
			
			-- Read = Write means empty
			if Read = Write then
				oFifoEmpty <= '1';
			else
				oFifoEmpty <= '0';
			end if;
			
			-- if fifo is full
			if  (Write+1 = Read) or							-- write stand one before read
				(Write = gFifoStages-1 and Read = 0) then	-- write stand one before read but over the edge of the ringbuffer
				oFifoFull <= '1';
			else
				oFifoFull <= '0';
			end if;
			
		end if;		
	end process;

end architecture RTL;
