# Metabolic-Scripts 

Bash and R scripts for research article

**Larissa Balabanova, Olga Nedashkovskaya,Nadezhda Otstavnykh, Marina Isaeva, Oksana Kolpakova,Iuliia Pentehina, Aleksandra Seitkalieva, Yulia Noskova, Varvara Stepochkina, Oksana Son, Liudmila Tekutyeva <br>**

# Computational insight into intraspecies distinctions in Pseudoalteromonas distincta: carotenoid-like synthesis traits and genomic heterogeneity 

## Requirements

This project has been tasted using the following software:
* Ubuntu 20.04
* R version 4.1.3
* gapseq 1.2 https://gapseq.readthedocs.io/en/latest/index.html  (Zimmermann et al., 2021).

The pathway prediction part of gapseq is implemented as Bash shell script and the metabolic model generation part is written in R.
Linear optimisation can be performed with a different solvers (GLPK or CPLEX). Other requirements are exonerate, bedtools, and barrnap.

In addition, the following R packages are needed: data.table, stringr, sybil, getopt, reshape2, doParallel, foreach, R.utils, stringi, glpkAPI, and BioStrings.
Models can be exported as SBML file using sybilSBML or R data format (RDS) for further analysis in R, for example with sybil [65] or BacArena.

## Usage

1. It is necessary to download the *.fna files of the following strains genomes:

Pseudoalteromonas_arctica_A_37_1_2_GCA_000238395_4.fna
Pseudoalteromonas_distincta_16_SW_7_GCA_005877035_1.fna
Pseudoalteromonas_distincta_2_2A_13.fna
Pseudoalteromonas_distincta_ANT_505_GCA_000212655_3.fna
Pseudoalteromonas_distincta_ATCC700518T_GCA_000814675_1.fna
Pseudoalteromonas_distincta_U2A_GCA_008370225_1.fna
Pseudoalteromonas_elyakovii_SM1926_GCA_007786285_1.fna
Pseudoalteromonas_paragorgicola_KMM3548_GCA_014918315_1.fna
Pseudoalteromonas_sp_AC163_GCA_000497935_1.fna
Pseudoalteromonas_sp_TAE79_GCA_000498015_1.fna
Pseudoalteromonas_sp_TAE80_GCA_000498035_1.fna
Pseudoalteromonas_sp_TB25_GCA_000497995_1.fna



2. Prediction of enzyme reactions and reconstruction of metabolic pathways performed using gapseq.

More info in https://gapseq.readthedocs.io/en/latest/tutorials/yogurt.html

For each strain, execute the following commands, where $strain_name is the name of the strain.
Sea water was chosen as the medium, meerwasser.csv

./gapseq find -p all -b 200 -m Bacteria $strain_name.fna

./gapseq find-transport -b 200 $strain_name.fna

./gapseq draft -r $strain_name-all-Reactions.tbl -t $strain_name-Transporter.tbl -p $strain_name-all-Pathways.tbl -c $strain_name.fna -u 200 -l 100

./gapseq fill -m $strain_name-draft.RDS -n dat/media/meerwasser.csv -c $strain_name-rxnWeights.RDS -b 100 -g $strain_name-rxnXgenes.RDS



3. Search for enzymes of interest

./enzymes_search.sh


4. Find for "ID" and "pathway" of reactions of interest in gapseq output *.RDS and *-all-Pathways.tbl files
to create *FINALPATH.tbl files
and summary table of carotenoid-like enzymes

carotenoid-like enzymes.Rmd

5. Find for UniRef ID and ReactionsFound names of
reactions of interest in files *FINALPATH.tbl 
to create summary table of carotenoid-like enzymes.

./enzymes_summary_table.sh

