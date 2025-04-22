
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

## Reset Button (Center button on Nexys A7)
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports reset]

## Control Inputs
# Write enable switch
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports write]

# Display select (3-bit)
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports {select[0]}]
set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports {select[1]}]
set_property -dict { PACKAGE_PIN E10   IOSTANDARD LVCMOS33 } [get_ports {select[2]}]

# Number input (4-bit)
set_property -dict { PACKAGE_PIN G12   IOSTANDARD LVCMOS33 } [get_ports {num[0]}]
set_property -dict { PACKAGE_PIN F12   IOSTANDARD LVCMOS33 } [get_ports {num[1]}]
set_property -dict { PACKAGE_PIN E12   IOSTANDARD LVCMOS33 } [get_ports {num[2]}]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports {num[3]}]

## 7-Segment Display Outputs
# Anodes (Active low, DIG0-DIG7)
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports {anode[0]}]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports {anode[1]}]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports {anode[2]}]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports {anode[3]}]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports {anode[4]}]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports {anode[5]}]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports {anode[6]}]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports {anode[7]}]

# Cathodes (Active low, segments a-g)
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports {cathode[0]}]  # Segment A
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports {cathode[1]}]  # Segment B
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports {cathode[2]}]  # Segment C
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports {cathode[3]}]  # Segment D
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports {cathode[4]}]  # Segment E
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports {cathode[5]}]  # Segment F
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports {cathode[6]}]  # Segment G