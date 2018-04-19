#"PMID":"10835412","PMCID":"PMC1461096" #Inference of population structure using multilocus genotype data.
#"PMID":"12663554","PMCID":"PMC1462502" #Bayesian inference of recent migration rates using multilocus genotypes.
#PMID: 10835412 PMCID: PMC1461096 #Inference of population structure using multilocus  genotpye data



##Baillie, J. and B. Groombridge. 1996. “Salmo salar”. IUCN Red List of Threatened Species.  http://dx.doi.org/10.2305/IUCN.UK.1996.RLTS.T19855A9026693.en

##doi 10.1111/mec.13395 Transatlantic secondary contact in Atlantic salmon paper
##doi 10.1111/1755-0998.12157 NeEstimator V2: re-implementation of software for the estimation of contemporary effective population size (Ne) from genetic data

## DOI 10.1002/joc.1276 Very high resolution interploted climate surfaces for global land ares  

#DOI  10.1111/2041-210X.12067 diversity: and R package for estimation of pop genetics
##DOI 10.1093 PGD spider bioinformatics/article/28/2/298/198891

# 10.1111/mec.12972. Conservation genomics  of anadromous Atlantic salmon


dois = c('10.1111/2041-210X.12067','10.1093/bioinformatics/btr642','10.2305/IUCN.UK.1996.RLTS.T19855A9026693.en','10.1002/joc.1276', '10.1111/mec.12972', '10.1111/2041-210X.12067', '10.1111/1755-0998.12157', '10.1111/mec.13395')


poster_litcited = function(dois=""){
  write("",file = "literature_cited.txt")
  for (i in dois){
    ref = cr_cn(dois = i,format = "text", style = "journal-of-evolutionary-biology")
    write(ref,file="literature_cited.txt",append = TRUE)
  }
  write("",file="poster_literature_cited.txt")
  lit = read.delim("literature_cited.txt",sep="\t",fill=TRUE,header=FALSE,as.is=TRUE)
  for (line in lit){
    short_ref = gsub("(\\d\\d\\d\\d)(\\. .*)(\\. \\w*.*\\d+)(.*\\.).*\\.$","\\1\\3\\4", line)
    write(short_ref,file="poster_literature_cited.txt",append = TRUE)
  }
}

poster_litcited(dois)
