# -*- coding: utf-8 -*-
"""
Created on Thu Mar 29 15:13:25 2018

@author: Danielle
"""

import os
os.chdir("")

# Mar 29/18
### The Southern NL dataset is not in a standard format
### This code is to convert it to a genepop file 
# Apr 15/18
### Unique NL populations from the big dataset were added to create a larger NL file

##### Importing file

rawMS=open("Microsatellite data.csv",'r')
rawMS=rawMS.read().replace("\n"," ")

##### Pulling out microsatellites

import re

Microsats=re.search("RiverCode.*U3", rawMS)
Microsats=Microsats.group(0)
Microsats=re.sub("RiverCode,(.*)", "\\1", Microsats)
Microsats=re.sub(",,", "\n", Microsats)

##### Indexing populations
## Making a list of populations
Pops=re.search("BBA.*", rawMS)
Pops=Pops.group(0)
Pops=re.findall("[A-Z]+",Pops)
import numpy as np
Pops=np.unique(Pops).tolist()

## Numbering each individual per population
indexedpop=open("Pops.txt",'w')
for i in Pops:
    j=1
    rivercode=i
    indexedpop.write("POP\n")
    rawfile=open("Microsatellite data.csv",'r') 
    for line in rawfile:
        if line.startswith(rivercode + ","):
            newline=re.sub(rivercode,rivercode + "_%s,", line)%j
            j=j+1
            indexedpop.write(newline)
indexedpop.close()

## Formatting alleles

Alleles=open("Pops.txt",'r')
Alleles=Alleles.read()
Alleles=re.sub(",,",",\t",Alleles)    
Alleles=re.sub("([0-9]{3}),([0-9]{3})", " \\1\\2 ", Alleles)
Alleles=re.sub("0,0"," 000000 ", Alleles)
Alleles=re.sub(" ,","",Alleles)

## Writing genepop file

genepopout=open("SouthernNF.GENEPOP","w")
genepopout.write("Southern Newfoundland Atlantic Salmon microsatellite data\n%s\n%s" %(Microsats,Alleles))
genepopout.close()

######### Adding NL populations from big file
##### Extracting NL pops only
NLfrombig=open("NLsub.txt",'w')
rawfilebig=open("Ssalar_usat_genepop_23Sep2014.txt_sequence=1.1",'r') 
for line in rawfilebig:
    if line.startswith("NL"):
        newline=line
        NLfrombig.write(newline)
NLfrombig.close()

## Removing NL identifier
newPOPs=open("NLsub.txt",'r')
newPOPs=newPOPs.read()
newPOPs=re.sub("NL-", "", newPOPs)
newPOPs=newPOPs.split("\n")

# One river is listed in the dataset but never identified in the paper. 
#Adding this river to the list to be removed because we don't know where it's located.
Pops.append("RBB") 

## Removing populations already in the Southern NL dataset
newPOPsfile=open("NLnewPops.txt",'w')  
for line in newPOPs:
    if line.startswith(tuple(Pops)):
        line=re.sub(".*","",line)
        newPOPsfile.write(line)
    else:
        newPOPsfile.write(line+"\n")
newPOPsfile.close() 

##### Adding "POP" before each new pop
## making a list of new river codes
newRivercodes=open("NLnewPops.txt",'r')
newRivercodes=newRivercodes.read()
newRivercodes=re.sub("NL-", "", newRivercodes)
newRivercodes=re.findall("[A-Z]+",newRivercodes)
newRivercodes=np.unique(newRivercodes).tolist()

## writing POP before each new river code
popdivision=open("NLnewpops2.txt",'w')
for i in newRivercodes:
    rivercode=i
    rawfile=open("NLnewPops.txt",'r')
    popdivision.write("POP\n")
    for line in rawfile:
        if line.startswith(rivercode):
            popdivision.write(line)
popdivision.close()

##### Rearranging allele columns from new pops to match the Southern NL order
## making a list of Southern NL alleles in order
MSOrder=Microsats.split("\n") 

## making a list of new pop alleles in order 
NewPopColumns=open("Ssalar_usat_genepop_23Sep2014.txt_sequence=1.1", 'r')
NewPopColumns=NewPopColumns.read()
NewPopColumns=NewPopColumns.split("\n",1)[1]
NewPopColumns=re.sub("\n"," ",NewPopColumns)
NewPopColumns=re.sub("POP.*","",NewPopColumns)
NewPopColumns=NewPopColumns.split(" ")[0:-1]

## splitting the new pops string into a list of each line
newPOPs=open("NLnewpops2.txt",'r') 
newPOPs=newPOPs.read().split("\n")
for i in range(0,len(newPOPs)):
    newPOPs[i]=newPOPs[i].split()

## Renaming alleles so they're identical
print(MSOrder,NewPopColumns) 
NewPopColumns[6]="SSOSL417"
NewPopColumns[7]="SSsp2210"
NewPopColumns[8]="SSsp2215"
NewPopColumns[9]="SSsp2216"
NewPopColumns[10]="SSspG7"
NewPopColumns[11]="U3"
NewPopColumns[12]="SsaD486"
NewPopColumns[13]="SsaD58"
NewPopColumns[14]="SSsp2201"

## adding a column label for river codes  
NewPopColumns.insert(0,"Rivercode")
MSOrder.insert(0,"Rivercode")

## putting new pops into a dataframe
import pandas as pd
allele_reorder=pd.DataFrame.from_records(newPOPs, columns=NewPopColumns)

## reordering columns to match allele order of Southern NL file
allele_reorder=allele_reorder.reindex_axis(MSOrder, axis=1)

## converting back to a string 
addedpops=allele_reorder.to_string(index=False, header=False)
addedpops=re.sub("None","",addedpops)
addedpops=re.sub("      (POP)","\\1",addedpops)

## opening Southern NL without header 
SouthernNL=open("SouthernNF.GENEPOP",'r')
SouthernNL=SouthernNL.read().split("\n")
SouthernNL=SouthernNL[1:len(SouthernNL)]
SouthernNL="\n".join(SouthernNL)

## writing Southern NL and new pops to one file 
genepopout=open("CombNL.GENEPOP","w")
genepopout.write("Combined NL Populations\n")
for line in SouthernNL:
    genepopout.write(line)
for line in addedpops:
    genepopout.write(line)
genepopout.close() 
