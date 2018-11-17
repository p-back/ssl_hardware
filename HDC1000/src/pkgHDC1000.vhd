-------------------------------------------------------------------------
-- pkgHDC1000.vhd
--
-- Author: Elias Geissler
-- Project: SSL1 Master ESD at FH Hagenberg
-------------------------------------------------------------------------
-- Description: this package provides some constant and types specific for the operation with HDC1000 (temp and humidity sensor)

package pkgHDC1000 is
	
	-- register file address constants
	constant cRegAddrTemp_L 		: natural := 0;
	constant cRegAddrTemp_H 		: natural := 1;
	constant cRegAddrHumidity_L 	: natural := 2;
	constant cRegAddrHumidity_H 	: natural := 3;
	constant cRegAddrTimeStamp_0 	: natural := 4;
	constant cRegAddrTimeStamp_1 	: natural := 5;
	constant cRegAddrTimeStamp_2 	: natural := 6;
	constant cRegAddrTimeStamp_3 	: natural := 7;
	constant cRegAddrFrequenzy_L	: natural := 8;
	constant cRegAddrFrequenzy_H	: natural := 9;
	constant cRegAddrConfig_L		: natural := 10;
	constant cRegAddrConfig_H		: natural := 11;
	
	-- fifo range types
	subtype tFifoRangeTemp_L 		is natural range 7  downto 0;
	subtype tFifoRangeTemp_H 		is natural range 15 downto 8;
	subtype tFifoRangeHumidity_L 	is natural range 23 downto 16;
	subtype tFifoRangeHumidity_H 	is natural range 31 downto 24;
	subtype tFifoRangeTimeStamp_0 	is natural range 39 downto 32;
	subtype tFifoRangeTimeStamp_1 	is natural range 47 downto 40;
	subtype tFifoRangeTimeStamp_2 	is natural range 55 downto 48;
	subtype tFifoRangeTimeStamp_3 	is natural range 63 downto 56;

	
end package pkgHDC1000;
