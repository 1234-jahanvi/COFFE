loadConfig edi.conf 
floorPlan -site CoreSite -r 8.0 0.70 10 10 10 10
setMaxRouteLayer 4 
fit 
addRing -spacing_bottom 1 -spacing_right 1 -spacing_top 1 -spacing_left 1 -width_right 3 -width_left 3 -width_bottom 3 -width_top 3 -center 1 -around core -layer_top Metal1 -layer_bottom Metal1 -layer_left Metal2 -layer_right Metal2 -nets { VSS VDD } -stacked_via_top_layer Metal4 -stacked_via_bottom_layer Metal1 
setPlaceMode -fp false -maxRouteLayer 4
placeDesign -inPlaceOpt -noPrePlaceOpt 
checkPlace matrix_multiplication 
trialroute 
buildTimingGraph 
timeDesign -preCTS -idealClock -numPaths 10 -prefix preCTS -outDir /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/timeDesignpreCTSReports
optDesign -preCTS -outDir /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/optDesignpreCTSReports
addFiller -cell {FILL1 FILL16 FILL2 FILL32 FILL4 FILL64 FILL8} -prefix FILL -merge true 
clearGlobalNets 
globalNetConnect VSS -type pgpin -pin VSS -inst {} 
globalNetConnect VDD -type pgpin -pin VDD -inst {} 
globalNetConnect VSS -type net -net VSS 
globalNetConnect VDD -type net -net VDD 
globalNetConnect VDD -type pgpin -pin VDD -inst * 
globalNetConnect VSS -type pgpin -pin VSS -inst * 
globalNetConnect VDD -type tiehi -inst * 
globalNetConnect VSS -type tielo -inst * 
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1 Metal4 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer Metal1 -allowLayerChange 1 -targetViaTopLayer Metal4 -crossoverViaTopLayer Metal4 -targetViaBottomLayer Metal1 -nets { VSS VDD } 
routeDesign -globalDetail
setExtractRCMode -engine postRoute 
extractRC 
buildTimingGraph 
timeDesign -postRoute -outDir /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/timeDesignReports
optDesign -postRoute -outDir /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/optDesignReports
verifyGeometry -report /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/matrix_multiplication.geom.rpt
verifyConnectivity -type all -report /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/matrix_multiplication.conn.rpt
summaryReport -outFile /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/pr_report.txt 
saveNetlist /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/netlist.v
saveDesign /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/design.enc 
rcOut -spef /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/spef.spef 
write_sdf -ideal_clock_network /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/sdf.sdf 
streamOut /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/final.gds2 -stripes 1 -units 1000 -mode ALL
exit 
