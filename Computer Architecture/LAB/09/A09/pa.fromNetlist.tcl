
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name A09 -dir "C:/Users/Admin/Desktop/A09/planAhead_run_1" -part xc3s400pq208-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Admin/Desktop/A09/alu_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Admin/Desktop/A09} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "alu_top.ucf" [current_fileset -constrset]
add_files [list {alu_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
