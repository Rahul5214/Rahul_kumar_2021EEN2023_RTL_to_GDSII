if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name min_timing_library\
   -timing\
    [list ${::IMEX::libVar}/mmmc/uk65lscllmvbbr_110c-40_bc_ccs.lib]
create_library_set -name max_timing_library\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/uk65lscllmvbbr_090c125_wc_ccs.lib]
create_rc_corner -name Default_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/Default_rc_corner/qrcTechFile.tch
create_delay_corner -name min_delay_corner\
   -library_set min_timing_library\
   -rc_corner Default_rc_corner
create_delay_corner -name max_delay_corner\
   -library_set max_timing_library\
   -rc_corner Default_rc_corner
create_constraint_mode -name counter_constraints\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/counter_constraints/counter_constraints.sdc]
create_analysis_view -name best_case -constraint_mode counter_constraints -delay_corner min_delay_corner -latency_file ${::IMEX::dataVar}/mmmc/views/best_case/latency.sdc
create_analysis_view -name worst_case -constraint_mode counter_constraints -delay_corner max_delay_corner -latency_file ${::IMEX::dataVar}/mmmc/views/worst_case/latency.sdc
set_analysis_view -setup [list worst_case] -hold [list best_case]
