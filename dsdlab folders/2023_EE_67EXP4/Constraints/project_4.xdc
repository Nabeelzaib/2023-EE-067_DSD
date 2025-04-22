#a inputs
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { a[1] }];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { a[0] }];

#b inputs
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { b[1] }];
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { b[0] }];

# Outputs
# Output leds
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { R }];
set_property -dict { PACKAGE_PIN R11 IOSTANDARD LVCMOS33 } [get_ports { G }];
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { B }];