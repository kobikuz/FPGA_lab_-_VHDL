set_global_assignment -entity "pll_002" -library "lib_pll_002" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_002" -library "lib_pll_002" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "pll_002" -library "lib_pll_002" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_002" -name SPD_FILE [file join $::quartus(sip_path) "pll_002.spd"]

set_global_assignment -library "lib_pll_002" -name MISC_FILE [file join $::quartus(sip_path) "pll_002_sim/pll_002.vho"]
