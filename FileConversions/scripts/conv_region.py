# -*- coding: utf-8 -*-
"""
Created on Mon Apr 16 11:59:18 2018

@author: Danielle
"""

import os
os.chdir("C:\\Users\\Danielle\\Documents\\Biol812\\BigDataProj\\Salmon-Project")

### Grouping NL populations into regions 

##### importing file 

CombNL=open("CombNL.GENEPOP",'r')
CombNL=CombNL.read()

##### Replacing River codes with region code

import re
NLbyRegion=re.sub("_|-","",CombNL)
NLbyRegion=re.sub("PHR\d+", "ARN",NLbyRegion) #Arnold's Cove
NLbyRegion=re.sub("CMB\d+|CNR\d+|LRD\d+|BBR\d+|JUB\d+|LJB\d+|RBR\d+|SBM\d+", "BAYDE",NLbyRegion) #Bay D'Espoir
NLbyRegion=re.sub("DWB\d+|LOM\d+|TYB\d+", "DEER",NLbyRegion) #Deer Lake
NLbyRegion=re.sub("CCR\d+|DHB\d+|GBI\d+|GNR\d+|IAM\d+|LPR\d+|BDB\d+|COD\d+|FLB\d+|MBA\d+|PGB\d+", "SWC",NLbyRegion) #Southwest coast
NLbyRegion=re.sub("ALX\d+|BIG\d+|ENG\d+|HUR\d+|KEN\d+|NBT\d+|PIN\d+|RWR\d+|SAN\d+|SMR\d+", "LAB",NLbyRegion) #Labrador
NLbyRegion=re.sub("BER\d+|BVB\d+|ROF\d+|ROP\d+|SGR\d+|WAB\d+", "NOR",NLbyRegion) #North
NLbyRegion=re.sub("CMP\d+|GSB\d+|IAB\d+|IBB\d+|SRN\d+|TNR\d+", "EAST",NLbyRegion) #East
NLbyRegion=re.sub("BDN\d+|FBS\d+|GAR\d+|GBB\d+|LHR\d+|SWB\d+", "FORBAY",NLbyRegion) #Fortune Bay
NLbyRegion=re.sub("BBA\d+|LSR\d+|NHR\d+|RKR\d+|SLR\d+", "STMAR",NLbyRegion) #St. Mary's Bay
NLbyRegion=re.sub("BSB\d+|NWT\d+|STN\d+|STS\d+", "TRBAY",NLbyRegion) #Trepassey Bay
NLbyRegion=re.sub("NPR\d+|SPR\d+", "PLA",NLbyRegion) #Placentia Bay
NLbyRegion=re.sub("GRB\d+|OBB\d+", "GRBAY",NLbyRegion) #Great Bay de l'Eau
NLbyRegion=re.sub("MNR\d+", "POLL",NLbyRegion) #Pollard's Point

##### Removing unknown rivers (not identified in supplementary)
  
delpops=("BDNB","GRR","RBB","WBR")

NLbyRegion=NLbyRegion.split("\n")
NLbyRegionPops=NLbyRegion[17:len(NLbyRegion)]
NLbyRegionHeader=NLbyRegion[0:15]
NLbyRegionHeader[0]="NL populations by region"
NLbyRegionHeader="\n".join(NLbyRegionHeader)
NLbyRegionPops=sorted(NLbyRegionPops)
NLbyRegionPops.remove(NLbyRegionPops[0])

NLbyRegionFile=open("NLbyRegionFile.txt",'w')
for line in NLbyRegionPops:
    if line.startswith(delpops):
        line=re.sub(".*","",line)
        NLbyRegionFile.write(line)
    elif line.startswith("POP"):
        line=re.sub(".*","",line)
        NLbyRegionFile.write(line)
    else:
        NLbyRegionFile.write(line+"\n")
NLbyRegionFile.close()

##### indexing regions

NLbyRegion=open("NLbyRegionFile.txt",'r')
NLbyRegion=NLbyRegion.read().replace("\n"," ")
Regions=re.search("ARN.*", NLbyRegion,)
Regions=Regions.group(0)
Regions=re.findall("[A-Z]+",Regions)
import numpy as np
Regions=np.unique(Regions).tolist()

##### Adding index and writing genepop file

IndNLbyRegionFile=open("NLRegions.GENEPOP",'w')
IndNLbyRegionFile.write("%s\n" %NLbyRegionHeader)
for i in Regions:
    j=1
    regioncode=i
    IndNLbyRegionFile.write("POP\n")
    NLbyRegion=open("NLbyRegionFile.txt",'r')
    for line in NLbyRegion:
        if line.startswith(regioncode + ","):
            newline=re.sub(regioncode,regioncode + "-%s", line)%j
            j=j+1
            IndNLbyRegionFile.write(newline)
IndNLbyRegionFile.close()

