#!/bin/bash
# This script is used to find UniRef ID and ReactionsFound names of
reactions of interest in files *FINALPATH.tbl to create a summary table of carotenoid-like enzymes.
echo -n "	"
echo -n "dye-decolorizing peroxidase"
echo -n "farnesyl diphosphate synthase"
echo -n "lycopene cyclase"
echo -n "carotene hydroxylase"
echo -n "geranylgeranyl diphosphate synthase"
echo -n "phytoene synthase"
echo -n "phytoene desaturase"
echo -n "carotene isomerase"
echo -n "carotene desaturase"
echo -n "cis-carotene isomerase"
echo -n "carotene hydroxylase"
echo -n "carotene ketolase"
echo -n "carotene ketolase"
echo -n "isopentenyl diphosphate"
echo -n "farnesyl diphosphate"
echo -n "geranylgeranyl diphosphate"
echo -n "homogentisate 1,2-dioxygenase"
echo -n "alginate lyases"
echo -n "alginate utilization operon transcriptional repressor AlgR"
echo -n "xylan 1,4-beta-xylosidase"
echo -n "endo-1,4-beta-xylanase"
echo -n "pectinesterase"
echo -n "pectin degradation protein KdgF"
echo -n "pectate lyase"
echo -n "beta-ketoacyl synthase"
echo -n "3-oxoacyl- synthase"
echo
for modelA in "Pseudoalteromonas_arctica_A_37_1_2_GCA_000238395_4" "Pseudoalteromonas_distincta_16_SW_7_GCA_005877035_1" "Pseudoalteromonas_distincta_2_2A_13" "Pseudoalteromonas_distincta_ANT_505_GCA_000212655_3" "Pseudoalteromonas_distincta_ATCC700518T_GCA_000814675_1" "Pseudoalteromonas_elyakovii_SM1926_GCA_007786285_1" "Pseudoalteromonas_paragorgicola_KMM3548_GCA_014918315_1" "Pseudoalteromonas_sp_AC163_GCA_000497935_1" "Pseudoalteromonas_distincta_16_SW_7_GCA_005877035_1" "Pseudoalteromonas_sp_TAE79_GCA_000498015_1" "Pseudoalteromonas_sp_TAE80_GCA_000498035_1" "Pseudoalteromonas_sp_TB25_GCA_000497995_1" "Pseudoalteromonas_distincta_U2A_GCA_008370225_1" 
# strain cycle
do
	echo -n "$modelA	"	
	cd $modelA
	for name in `ls`
	do
		if [[ `grep "UniRef" $name` ]] 
		then	
			echo -n "1	"	
		elif ! [[ `grep "ReactionsFound" $name` ]] 
		then
			echo -n "0	"	
		fi
	done
	cd ..
	echo	
done
		




