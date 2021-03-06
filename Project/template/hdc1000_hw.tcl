# TCL File Generated by Component Editor 16.1
# Sun Dec 16 11:44:38 CET 2018
# DO NOT MODIFY


# 
# HDC1000 "HDC1000" v1.0
# Elias Geissler 2018.12.16.11:44:38
# reads data from HDC1000 and provides it per AvalonMM
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module HDC1000
# 
set_module_property DESCRIPTION "reads data from HDC1000 and provides it per AvalonMM"
set_module_property NAME HDC1000
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP SSL
set_module_property AUTHOR "Elias Geissler"
set_module_property DISPLAY_NAME HDC1000
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL HDC1000
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file HDC1000.vhd VHDL PATH ../../HDC1000/src/HDC1000.vhd TOP_LEVEL_FILE
add_fileset_file pkgHDC1000.vhd VHDL PATH ../../HDC1000/src/pkgHDC1000.vhd
add_fileset_file pkgGlobal.vhd VHDL PATH ../../PkgGlobal/pkgGlobal.vhd
add_fileset_file Sync.vhd VHDL PATH ../../Sync/src/Sync.vhd
add_fileset_file Fifo.vhd VHDL PATH ../../Fifo/src/Fifo.vhd
add_fileset_file I2C.VHD VHDL PATH ../../I2cUnit/src/I2C.VHD
add_fileset_file FSMDHDC1000.vhd VHDL PATH ../../HDC1000/src/FSMDHDC1000.vhd
add_fileset_file RegFile.vhd VHDL PATH ../../RegFile/src/RegFile.vhd
add_fileset_file I2cController.vhd VHDL PATH ../../I2cUnit/src/I2cController.vhd


# 
# parameters
# 
add_parameter gClkFrequency NATURAL 50000000
set_parameter_property gClkFrequency DEFAULT_VALUE 50000000
set_parameter_property gClkFrequency DISPLAY_NAME gClkFrequency
set_parameter_property gClkFrequency TYPE NATURAL
set_parameter_property gClkFrequency UNITS None
set_parameter_property gClkFrequency ALLOWED_RANGES 0:2147483647
set_parameter_property gClkFrequency HDL_PARAMETER true
add_parameter gI2cFrequency NATURAL 400000
set_parameter_property gI2cFrequency DEFAULT_VALUE 400000
set_parameter_property gI2cFrequency DISPLAY_NAME gI2cFrequency
set_parameter_property gI2cFrequency TYPE NATURAL
set_parameter_property gI2cFrequency UNITS None
set_parameter_property gI2cFrequency ALLOWED_RANGES 0:2147483647
set_parameter_property gI2cFrequency HDL_PARAMETER true
add_parameter gSyncStages NATURAL 2
set_parameter_property gSyncStages DEFAULT_VALUE 2
set_parameter_property gSyncStages DISPLAY_NAME gSyncStages
set_parameter_property gSyncStages TYPE NATURAL
set_parameter_property gSyncStages UNITS None
set_parameter_property gSyncStages ALLOWED_RANGES 0:2147483647
set_parameter_property gSyncStages HDL_PARAMETER true
add_parameter gResetIsLowActive INTEGER 1
set_parameter_property gResetIsLowActive DEFAULT_VALUE 1
set_parameter_property gResetIsLowActive DISPLAY_NAME gResetIsLowActive
set_parameter_property gResetIsLowActive TYPE INTEGER
set_parameter_property gResetIsLowActive UNITS None
set_parameter_property gResetIsLowActive ALLOWED_RANGES -2147483648:2147483647
set_parameter_property gResetIsLowActive HDL_PARAMETER true


# 
# module assignments
# 
set_module_assignment embeddedsw.dts.group rfs_sensorboard
set_module_assignment embeddedsw.dts.name hdc1000
set_module_assignment embeddedsw.dts.vendor ssl


# 
# display items
# 


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 50000000
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink iClk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink inRstAsync reset Input 1


# 
# connection point i2c
# 
add_interface i2c conduit end
set_interface_property i2c associatedClock clock_sink
set_interface_property i2c associatedReset ""
set_interface_property i2c ENABLED true
set_interface_property i2c EXPORT_OF ""
set_interface_property i2c PORT_NAME_MAP ""
set_interface_property i2c CMSIS_SVD_VARIABLES ""
set_interface_property i2c SVD_ADDRESS_GROUP ""

add_interface_port i2c ioSCL i2c_clk Bidir 1
add_interface_port i2c ioSDA i2c_data Bidir 1


# 
# connection point timing
# 
add_interface timing conduit end
set_interface_property timing associatedClock clock_sink
set_interface_property timing associatedReset ""
set_interface_property timing ENABLED true
set_interface_property timing EXPORT_OF ""
set_interface_property timing PORT_NAME_MAP ""
set_interface_property timing CMSIS_SVD_VARIABLES ""
set_interface_property timing SVD_ADDRESS_GROUP ""

add_interface_port timing iStrobe strobe Input 1
add_interface_port timing iTimeStamp strobe_cnt Input 32


# 
# connection point avalon_slave
# 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressUnits SYMBOLS
set_interface_property avalon_slave associatedClock clock_sink
set_interface_property avalon_slave associatedReset reset_sink
set_interface_property avalon_slave bitsPerSymbol 8
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave burstcountUnits SYMBOLS
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave maximumPendingWriteTransactions 0
set_interface_property avalon_slave readLatency 0
set_interface_property avalon_slave readWaitTime 1
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0
set_interface_property avalon_slave ENABLED true
set_interface_property avalon_slave EXPORT_OF ""
set_interface_property avalon_slave PORT_NAME_MAP ""
set_interface_property avalon_slave CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave iAvalonAddr address Input 8
add_interface_port avalon_slave iAvalonRead read Input 1
add_interface_port avalon_slave oAvalonReadData readdata Output 8
add_interface_port avalon_slave iAvalonWrite write Input 1
add_interface_port avalon_slave iAvalonWriteData writedata Input 8
set_interface_assignment avalon_slave embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave embeddedsw.configuration.isPrintableDevice 0

