

## Automate sessions 
cd /EXTERN_Shared/outgoing/Shared_with_Mine_20220328/
  gzip -r ./*
  #!/bin/bash
  screen -d -m -S newsession
for n in {0..9}; do
# create now window using `screen` command
screen -S newsession -X screen $n
screen -S newsession -p $n -X stuff cd /Cluster_Filespace/Marioni_Group/Rob/GWAS_SCALLOP_neuro/
  FILES=(*)


for i in ${FILES[@]:30:10}; do  echo $i; for x in {1..22} ; do  echo $x; data=/Cluster_Filespace/Marioni_Group/Rob/GWAS_SCALLOP_neuro/$i/${i}_res.dat; pedi=/Cluster_Filespace/Marioni_Group/Rob/GWAS_SCALLOP_neuro/$i/${i}_res.ped; info=/GWAS_Source/GWAS_Data/LBC_36/1000G_phase1v3/Data/CHR${x}_results.info; dose=/GWAS_Source/GWAS_Data/LBC_36/1000G_phase1v3/Data/CHR${x}_results.dose ; mach2qtl-ext -d $data -p $pedi -i $info --dosefile $dose --samplesize > /Cluster_Filespace/Marioni_Group/Rob/GWAS_SCALLOP_neuro/$i/${i}_output_chr${x}.out; done; done
