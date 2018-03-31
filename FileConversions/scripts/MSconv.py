# -*- coding: utf-8 -*-
"""
Created on Thu Mar 29 15:13:25 2018

@author: Danielle
"""

import os
os.chdir("")

### This dataset is not in a standard format. This code is to convert it to a genepop file

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
