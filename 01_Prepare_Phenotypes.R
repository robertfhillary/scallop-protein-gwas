
##### NEUROLOGY PROTEINS ############

## set working directory
setwd("/Cluster_Filespace/Marioni_Group/Rob/GWAS_SCALLOP_neuro/")

## get protein names 
prot = list.files(".", ".")

## exclude proteins not needed/failed QC 
prot = prot[-which(prot %in% c("HAGH", "MAPT"))]

## extract protein names - will use in naming the files 
prot.names <- prot 

## match naming of protein names to that in Olink file
prot.names = gsub("_", "-", prot.names)

## read in naming system file 
sys = read.csv("../Neuro_OlinkID_UniprotID.csv")

## fix three proteins with whitespace 
sys$Assay <- gsub(" ", "-", sys$Assay)


# Loop through proteins and save them out with appropriate naming system 

for(i in 1:length(prot)){ 
  ## read in file 
  file = paste0(prot[i], "/", prot[i], "_res.processed")
  tmp = as.data.frame(fread(file))
  
  ## remove strand column - all positive 
  tmp$strand <- NULL 
  
  ## extract protein names
  nm = sys[which(sys$Assay %in% prot.names[i]),]
  ## name file as instructed 
  filename = paste0(nm$UniprotID, "_", nm$OlinkID, "_", nm$Assay, "_", "Neurology","_", "LothianBirthCohort1936", "_", "20220324", "_", "RFH")
  
  write.table(tmp, paste0("/Cluster_Filespace/Marioni_Group/Rob/Shared_with_Mine_24032022/", filename, ".txt"), row.names = F)
  print(i)
}



##### INFLAMMATORY PROTEINS ############

## set working directory
setwd("/Cluster_Filespace/Marioni_Group/Rob/Inflammatory_Proteins/GWAS_SCALLOP_unstandardised/")

## get protein names 
prot = list.files(".", ".")

## exclude proteins not needed/failed QC 

qc = read.csv("../Seventy_proteins.csv")
qc$Protein = gsub("\\.", "_", qc$Protein)
prot = prot[which(prot %in% qc$Protein)]

## extract protein names - will use in naming the files 
prot.names <- prot 

## read in naming system file 
sys = read.csv("../../Inflam_OlinkID_UniprotID.csv")

## match naming of protein names to that in Olink file
prot.names = gsub("_", "-", prot.names)

## fix one protein with whitespace 
sys$Assay <- gsub(" ", "-", sys$Assay)

## fix one prot.name with extra 'X'
prot.names[70] <- "4E-BP1"

## subset naming system file to 70 proteins that passed QC 
sys = sys[which(sys$Assay %in% prot.names),]


# Loop through proteins and save them out with appropriate naming system 

for(i in 1:length(prot)){ 
  ## read in file 
  file = paste0(prot[i], "/", prot[i], "_res.processed")
  tmp = as.data.frame(fread(file))
  
  ## remove strand column - all positive 
  tmp$strand <- NULL 
  
  ## extract protein names
  nm = sys[which(sys$Assay %in% prot.names[i]),]
  
  ## name file as instructed 
  filename = paste0(nm$UniprotID, "_", nm$OlinkID, "_", nm$Assay, "_", "Inflammation","_", "LothianBirthCohort1936", "_", "20220324", "_", "RFH")
  
  write.table(tmp, paste0("/Cluster_Filespace/Marioni_Group/Rob/Shared_with_Mine_24032022/", filename, ".txt"), row.names = F)
  print(i)
}

