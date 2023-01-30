#!/bin/bash
echo "
Script to search for the following enzymes in given strains:
1-"dye-decolorizing peroxidase"
2-"farnesyl diphosphate synthase"
3-"lycopene cyclase"
4-"carotene hydroxylase"
5-"geranylgeranyl diphosphate synthase"
6-"phytoene synthase"
7-"phytoene desaturase"
8-"carotene isomerase"
9-"carotene desaturase"
10-"cis-carotene isomerase"
11-"carotene hydroxylase"
12-"carotene ketolase"
13-"carotene ketolase"
14-"isopentenyl diphosphate"
15-"farnesyl diphosphate"
16-"geranylgeranyl diphosphate"
17-"homogentisate 1,2-dioxygenase"
18-"alginate lyases"
19-"alginate utilization operon transcriptional repressor AlgR"
20-"xylan 1,4-beta-xylosidase"
21-"endo-1,4-beta-xylanase"
22-"pectinesterase"
23-"pectin degradation protein KdgF"
24-"pectate lyase"
25-"beta-ketoacyl synthase"
26-"3-oxoacyl- synthase"

$path_to_strains - path to folder with strains
"

for modelA in "Pseudoalteromonas_arctica_A_37_1_2_GCA_000238395_4" "Pseudoalteromonas_distincta_16_SW_7_GCA_005877035_1" "Pseudoalteromonas_distincta_2_2A_13" "Pseudoalteromonas_distincta_ANT_505_GCA_000212655_3" "Pseudoalteromonas_distincta_ATCC700518T_GCA_000814675_1" "Pseudoalteromonas_elyakovii_SM1926_GCA_007786285_1" "Pseudoalteromonas_paragorgicola_KMM3548_GCA_014918315_1" "Pseudoalteromonas_sp_AC163_GCA_000497935_1" "Pseudoalteromonas_distincta_16_SW_7_GCA_005877035_1" "Pseudoalteromonas_sp_TAE79_GCA_000498015_1" "Pseudoalteromonas_sp_TAE80_GCA_000498035_1" "Pseudoalteromonas_sp_TB25_GCA_000497995_1" "Pseudoalteromonas_distincta_U2A_GCA_008370225_1" # strain cycle
do
	let "enzname=1"
	mkdir $modelA
	for enzyme in "dye-decolorizing peroxidase" "farnesyl diphosphate synthase" "lycopene cyclase" "carotene hydroxylase" "geranylgeranyl diphosphate synthase" "phytoene synthase" "phytoene desaturase" "carotene isomerase" "carotene desaturase" "cis-carotene isomerase" "carotene hydroxylase" "carotene ketolase" "carotene ketolase" "isopentenyl diphosphate" "farnesyl diphosphate" "geranylgeranyl diphosphate" "homogentisate 1,2-dioxygenase" "alginate lyases" "alginate utilization operon transcriptional repressor AlgR" "xylan 1,4-beta-xylosidase" "endo-1,4-beta-xylanase" "pectinesterase" "pectin degradation protein KdgF" "pectate lyase" "beta-ketoacyl synthase" "3-oxoacyl- synthase" 		# enzyme cycle
	do
		./gapseq find -r "$enzyme" $path_to_strains/$modelA.fna
		mv $modelA-custom-Pathways.tbl $modelA/$modelA-$enzname-Pathways.tbl
		mv $modelA-custom-Reactions.tbl $modelA/$modelA-$enzname-Reactions.tbl
		let "enzname=enzname+1"
	done
done

