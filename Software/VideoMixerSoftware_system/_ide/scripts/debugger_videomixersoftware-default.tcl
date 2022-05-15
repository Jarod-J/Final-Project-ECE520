# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: G:\Git\Final-Project-ECE520\Software\VideoMixerSoftware_system\_ide\scripts\debugger_videomixersoftware-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source G:\Git\Final-Project-ECE520\Software\VideoMixerSoftware_system\_ide\scripts\debugger_videomixersoftware-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A77BB7A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351A77BB7A-13722093-0"}
fpga -file G:/Git/Final-Project-ECE520/Software/VideoMixerSoftware/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw G:/Git/Final-Project-ECE520/Software/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source G:/Git/Final-Project-ECE520/Software/VideoMixerSoftware/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow G:/Git/Final-Project-ECE520/Software/VideoMixerSoftware/Debug/VideoMixerSoftware.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
