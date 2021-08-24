## Impact of guidance publication on primary care prescribing rates: an interrupted time series analysis in England   
## Saran Shantikumar v0.2 4 Aug 2021
## Contact: saran.shantikumar@warwick.ac.uk
## Template script
## Version Control
# 0.2 - end date Dec 2019

## ATTACH PACKAGES -------------------

rm(list = ls())

list.of.packages <- c("foreign","tsModel","lmtest","Epi","splines","vcd","data.table","dplyr","plyr","RColorBrewer","ggplot2","plotly","Cairo","MASS","sandwich","jtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# load the packages
library(foreign)
library(tsModel)
library(lmtest)
library(Epi) 
library(splines)
library(vcd)
library(data.table)
library(dplyr)
library(plyr)
library(RColorBrewer)
library(ggplot2)
library(plotly)
library(Cairo)
library(MASS)
library(sandwich)
library(jtools)


## DEFINE DATA AND OUTPUT DIRECTORIES -----------------

# Define analysis folder
dirAnalysis <- "D:/MPH_Samya/Template"

# Define data folder
dirData <- "D:/prescribingdata"

# Set WD to analysis folder
setwd(dirAnalysis)

## FILTER PRESCRIBING DATA FOR BNF CODES OF INTEREST ----------------

# read in BNF codes of interest
keep <- read.csv("bnf_codes_drugclass.csv") # read in codes of drug of interest
keep <- as.vector(keep$bnf_code) # make list a vector
keep <- substr(keep,1,15) # keep first 15 letters of BNF code - this is the full BNF code, but occasionally extra characters are appended

# read in .csv file of GP prescription data for one month
setwd(dirData)
data <- fread("EPD_201501.csv", header=T,sep = ',')

# filter perscriptions by BNF codes of interest
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_01_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

# repeat for all other included monthly datasets, for example:

setwd(dirData)
data <- fread("EPD_201502.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_02_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201503.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_03_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201504.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_04_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201505.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_05_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201506.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_06_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201507.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_07_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201508.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_08_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201509.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_09_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201510.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_10_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201511.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_11_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201512.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2015_12_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201601.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_01_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201602.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_02_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201603.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_03_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201604.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_04_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201605.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_05_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201606.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_06_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201607.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_07_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201608.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_08_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201609.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_09_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201610.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_10_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201611.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_11_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201612.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2016_12_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201701.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_01_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201702.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_02_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201703.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_03_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201704.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_04_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201705.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_05_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201706.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_06_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201707.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_07_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201708.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_08_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201709.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_09_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201710.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_10_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201711.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_11_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201712.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2017_12_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201801.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_01_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201802.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_02_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201803.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_03_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201804.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_04_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201805.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_05_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201806.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_06_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201807.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_07_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201808.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_08_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201809.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_09_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201810.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_10_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201811.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_11_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201812.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2018_12_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201901.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_01_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201902.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_02_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201903.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_03_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201904.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_04_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201905.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_05_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201906.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_06_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201907.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_07_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201908.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_08_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201909.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_09_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201910.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_10_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201911.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_11_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

setwd(dirData)
data <- fread("EPD_201912.csv", header=T,sep = ',')
data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
setwd(dirAnalysis)
write.csv(data1, "2019_12_filtered.csv", row.names=F) # save
rm(data, data1) # remove unwanted data

# setwd(dirData)
# data <- fread("EPD_202001.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_01_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data
# 
# setwd(dirData)
# data <- fread("EPD_202002.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_02_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data
# 
# setwd(dirData)
# data <- fread("EPD_202003.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_03_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data
# 
# setwd(dirData)
# data <- fread("EPD_202004.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_04_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data
# 
# setwd(dirData)
# data <- fread("EPD_202005.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_05_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data
# 
# setwd(dirData)
# data <- fread("EPD_202006.csv", header=T,sep = ',')
# data1 <- data[data$`BNF_CODE` %in% keep, ] # filter by BNF codes in "keep"
# data1 <- data1[,c(1,6,7,8,9,15,16,17,18,20,21,22,23,24,25)] # keep columns of interest only
# setwd(dirAnalysis)
# write.csv(data1, "2020_06_filtered.csv", row.names=F) # save
# rm(data, data1) # remove unwanted data



# read in all filtered monthly data frames 

setwd(dirAnalysis)

data201501 <- read.csv("2015_01_filtered.csv")[,-11] # read in all filtered monthly data, GET RID OF EMPTY COLUMN v11 where this exists (up to and including Nov 2018)
data201502 <- read.csv("2015_02_filtered.csv")[,-11]
data201503 <- read.csv("2015_03_filtered.csv")[,-11]
data201504 <- read.csv("2015_04_filtered.csv")[,-11]
data201505 <- read.csv("2015_05_filtered.csv")[,-11]
data201506 <- read.csv("2015_06_filtered.csv")[,-11]
data201507 <- read.csv("2015_07_filtered.csv")[,-11]
data201508 <- read.csv("2015_08_filtered.csv")[,-11]
data201509 <- read.csv("2015_09_filtered.csv")[,-11]
data201510 <- read.csv("2015_10_filtered.csv")[,-11]
data201511 <- read.csv("2015_11_filtered.csv")[,-11]
data201512 <- read.csv("2015_12_filtered.csv")[,-11]
data201601 <- read.csv("2016_01_filtered.csv")[,-11] 
data201602 <- read.csv("2016_02_filtered.csv")[,-11]
data201603 <- read.csv("2016_03_filtered.csv")[,-11]
data201604 <- read.csv("2016_04_filtered.csv")[,-11]
data201605 <- read.csv("2016_05_filtered.csv")[,-11]
data201606 <- read.csv("2016_06_filtered.csv")[,-11]
data201607 <- read.csv("2016_07_filtered.csv")[,-11]
data201608 <- read.csv("2016_08_filtered.csv")[,-11]
data201609 <- read.csv("2016_09_filtered.csv")[,-11]
data201610 <- read.csv("2016_10_filtered.csv")[,-11]
data201611 <- read.csv("2016_11_filtered.csv")[,-11]
data201612 <- read.csv("2016_12_filtered.csv")[,-11]
data201701 <- read.csv("2017_01_filtered.csv")[,-11] 
data201702 <- read.csv("2017_02_filtered.csv")[,-11]
data201703 <- read.csv("2017_03_filtered.csv")[,-11]
data201704 <- read.csv("2017_04_filtered.csv")[,-11]
data201705 <- read.csv("2017_05_filtered.csv")[,-11]
data201706 <- read.csv("2017_06_filtered.csv")[,-11]
data201707 <- read.csv("2017_07_filtered.csv")[,-11]
data201708 <- read.csv("2017_08_filtered.csv")[,-11]
data201709 <- read.csv("2017_09_filtered.csv")[,-11]
data201710 <- read.csv("2017_10_filtered.csv")[,-11]
data201711 <- read.csv("2017_11_filtered.csv")[,-11]
data201712 <- read.csv("2017_12_filtered.csv")[,-11]
data201801 <- read.csv("2018_01_filtered.csv")[,-11] 
data201802 <- read.csv("2018_02_filtered.csv")[,-11]
data201803 <- read.csv("2018_03_filtered.csv")[,-11]
data201804 <- read.csv("2018_04_filtered.csv")[,-11]
data201805 <- read.csv("2018_05_filtered.csv")[,-11]
data201806 <- read.csv("2018_06_filtered.csv")[,-11]
data201807 <- read.csv("2018_07_filtered.csv")[,-11]
data201808 <- read.csv("2018_08_filtered.csv")[,-11]
data201809 <- read.csv("2018_09_filtered.csv")[,-11]
data201810 <- read.csv("2018_10_filtered.csv")[,-11]
data201811 <- read.csv("2018_11_filtered.csv")[,-11]
data201812 <- read.csv("2018_12_filtered.csv")
data201901 <- read.csv("2019_01_filtered.csv")
data201902 <- read.csv("2019_02_filtered.csv")
data201903 <- read.csv("2019_03_filtered.csv")
data201904 <- read.csv("2019_04_filtered.csv")
data201905 <- read.csv("2019_05_filtered.csv")
data201906 <- read.csv("2019_06_filtered.csv")
data201907 <- read.csv("2019_07_filtered.csv")
data201908 <- read.csv("2019_08_filtered.csv")
data201909 <- read.csv("2019_09_filtered.csv")
data201910 <- read.csv("2019_10_filtered.csv")
data201911 <- read.csv("2019_11_filtered.csv")
data201912 <- read.csv("2019_12_filtered.csv")
# data202001 <- read.csv("2020_01_filtered.csv")
# data202002 <- read.csv("2020_02_filtered.csv")
# data202003 <- read.csv("2020_03_filtered.csv")
# data202004 <- read.csv("2020_04_filtered.csv")
# data202005 <- read.csv("2020_05_filtered.csv")
# data202006 <- read.csv("2020_06_filtered.csv")


## LINK OTHER PRACTICE DATA AND AGGREGATE BY MONTH ----------------

# Add monthly list size data to monthly prescribing data

setwd(dirAnalysis)
listsize201501 <- read.csv("2015_01_listsize.csv")[,c(1,6)] #only read in practice code and list size (this does not include OOH services)
names(listsize201501) <- c("PRACTICE", "LIST.SIZE") # rename columns so they are the same as the prescribing dataset

# Aggregate number of items and cost for monthly data where practice and period is the same
data201501 <- ddply(data201501,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201501) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") # rename columns so they are the same as the prescribing dataset

# Add list size data by practice
data201501 <- merge(data201501,listsize201501,by="PRACTICE") # add list size by practice

# Do the same for each monthly dataset:

listsize201502 <- read.csv("2015_02_listsize.csv")[,c(1,6)] 
names(listsize201502) <- c("PRACTICE", "LIST.SIZE") 
data201502 <- ddply(data201502,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201502) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201502 <- merge(data201502,listsize201502,by="PRACTICE") 

listsize201503 <- read.csv("2015_03_listsize.csv")[,c(1,6)] 
names(listsize201503) <- c("PRACTICE", "LIST.SIZE") 
data201503 <- ddply(data201503,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201503) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201503 <- merge(data201503,listsize201503,by="PRACTICE") 

listsize201504 <- read.csv("2015_04_listsize.csv")[,c(1,6)] 
names(listsize201504) <- c("PRACTICE", "LIST.SIZE") 
data201504 <- ddply(data201504,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201504) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201504 <- merge(data201504,listsize201504,by="PRACTICE") 

listsize201505 <- read.csv("2015_05_listsize.csv")[,c(1,6)] 
names(listsize201505) <- c("PRACTICE", "LIST.SIZE") 
data201505 <- ddply(data201505,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201505) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201505 <- merge(data201505,listsize201505,by="PRACTICE") 

listsize201506 <- read.csv("2015_06_listsize.csv")[,c(1,6)] 
names(listsize201506) <- c("PRACTICE", "LIST.SIZE") 
data201506 <- ddply(data201506,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201506) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201506 <- merge(data201506,listsize201506,by="PRACTICE") 

listsize201507 <- read.csv("2015_07_listsize.csv")[,c(1,9)] 
names(listsize201507) <- c("PRACTICE", "LIST.SIZE") 
data201507 <- ddply(data201507,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201507) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201507 <- merge(data201507,listsize201507,by="PRACTICE") 

listsize201508 <- read.csv("2015_08_listsize.csv")[,c(1,9)] 
names(listsize201508) <- c("PRACTICE", "LIST.SIZE") 
data201508 <- ddply(data201508,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201508) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201508 <- merge(data201508,listsize201508,by="PRACTICE") 

listsize201509 <- read.csv("2015_09_listsize.csv")[,c(1,9)] 
names(listsize201509) <- c("PRACTICE", "LIST.SIZE") 
data201509 <- ddply(data201509,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201509) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201509 <- merge(data201509,listsize201509,by="PRACTICE") 

listsize201510 <- read.csv("2015_10_listsize.csv")[,c(1,9)] 
names(listsize201510) <- c("PRACTICE", "LIST.SIZE") 
data201510 <- ddply(data201510,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201510) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201510 <- merge(data201510,listsize201510,by="PRACTICE") 

listsize201511 <- read.csv("2015_11_listsize.csv")[,c(1,9)] 
names(listsize201511) <- c("PRACTICE", "LIST.SIZE") 
data201511 <- ddply(data201511,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201511) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201511 <- merge(data201511,listsize201511,by="PRACTICE") 

listsize201512 <- read.csv("2015_12_listsize.csv")[,c(1,9)] 
names(listsize201512) <- c("PRACTICE", "LIST.SIZE") 
data201512 <- ddply(data201512,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201512) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201512 <- merge(data201512,listsize201512,by="PRACTICE") 

listsize201601 <- read.csv("2016_01_listsize.csv")[,c(1,9)] 
names(listsize201601) <- c("PRACTICE", "LIST.SIZE") 
data201601 <- ddply(data201601,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201601) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201601 <- merge(data201601,listsize201601,by="PRACTICE") 

listsize201602 <- read.csv("2016_02_listsize.csv")[,c(1,9)] 
names(listsize201602) <- c("PRACTICE", "LIST.SIZE") 
data201602 <- ddply(data201602,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201602) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201602 <- merge(data201602,listsize201602,by="PRACTICE") 

listsize201603 <- read.csv("2016_03_listsize.csv")[,c(1,9)] 
names(listsize201603) <- c("PRACTICE", "LIST.SIZE") 
data201603 <- ddply(data201603,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201603) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201603 <- merge(data201603,listsize201603,by="PRACTICE") 

listsize201604 <- read.csv("2016_04_listsize.csv")[,c(1,9)] 
names(listsize201604) <- c("PRACTICE", "LIST.SIZE") 
data201604 <- ddply(data201604,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201604) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201604 <- merge(data201604,listsize201604,by="PRACTICE") 

listsize201605 <- read.csv("2016_05_listsize.csv")[,c(1,9)] 
names(listsize201605) <- c("PRACTICE", "LIST.SIZE") 
data201605 <- ddply(data201605,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201605) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201605 <- merge(data201605,listsize201605,by="PRACTICE") 

listsize201606 <- read.csv("2016_06_listsize.csv")[,c(1,9)] 
names(listsize201606) <- c("PRACTICE", "LIST.SIZE") 
data201606 <- ddply(data201606,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201606) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201606 <- merge(data201606,listsize201606,by="PRACTICE") 

listsize201607 <- read.csv("2016_07_listsize.csv")[,c(1,9)] 
names(listsize201607) <- c("PRACTICE", "LIST.SIZE") 
data201607 <- ddply(data201607,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201607) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201607 <- merge(data201607,listsize201607,by="PRACTICE") 

listsize201608 <- read.csv("2016_08_listsize.csv")[,c(1,9)] 
names(listsize201608) <- c("PRACTICE", "LIST.SIZE") 
data201608 <- ddply(data201608,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201608) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201608 <- merge(data201608,listsize201608,by="PRACTICE") 

listsize201609 <- read.csv("2016_09_listsize.csv")[,c(1,9)] 
names(listsize201609) <- c("PRACTICE", "LIST.SIZE") 
data201609 <- ddply(data201609,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201609) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201609 <- merge(data201609,listsize201609,by="PRACTICE") 

listsize201610 <- read.csv("2016_10_listsize.csv")[,c(1,9)] 
names(listsize201610) <- c("PRACTICE", "LIST.SIZE") 
data201610 <- ddply(data201610,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201610) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201610 <- merge(data201610,listsize201610,by="PRACTICE") 

listsize201611 <- read.csv("2016_11_listsize.csv")[,c(1,9)] 
names(listsize201611) <- c("PRACTICE", "LIST.SIZE") 
data201611 <- ddply(data201611,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201611) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201611 <- merge(data201611,listsize201611,by="PRACTICE") 

listsize201612 <- read.csv("2016_12_listsize.csv")[,c(1,9)] 
names(listsize201612) <- c("PRACTICE", "LIST.SIZE") 
data201612 <- ddply(data201612,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201612) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201612 <- merge(data201612,listsize201612,by="PRACTICE") 

listsize201701 <- read.csv("2017_01_listsize.csv")[,c(1,9)] 
names(listsize201701) <- c("PRACTICE", "LIST.SIZE") 
data201701 <- ddply(data201701,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201701) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201701 <- merge(data201701,listsize201701,by="PRACTICE") 

listsize201702 <- read.csv("2017_02_listsize.csv")[,c(1,9)] 
names(listsize201702) <- c("PRACTICE", "LIST.SIZE") 
data201702 <- ddply(data201702,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201702) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201702 <- merge(data201702,listsize201702,by="PRACTICE") 

listsize201703 <- read.csv("2017_03_listsize.csv")[,c(1,9)] 
names(listsize201703) <- c("PRACTICE", "LIST.SIZE") 
data201703 <- ddply(data201703,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201703) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201703 <- merge(data201703,listsize201703,by="PRACTICE") 

listsize201704 <- read.csv("2017_04_listsize.csv")[,c(1,9)] 
names(listsize201704) <- c("PRACTICE", "LIST.SIZE") 
data201704 <- ddply(data201704,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201704) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201704 <- merge(data201704,listsize201704,by="PRACTICE") 

listsize201705 <- read.csv("2017_05_listsize.csv")[,c(1,9)] 
names(listsize201705) <- c("PRACTICE", "LIST.SIZE") 
data201705 <- ddply(data201705,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201705) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201705 <- merge(data201705,listsize201705,by="PRACTICE") 

listsize201706 <- read.csv("2017_06_listsize.csv")[,c(1,9)] 
names(listsize201706) <- c("PRACTICE", "LIST.SIZE") 
data201706 <- ddply(data201706,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201706) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201706 <- merge(data201706,listsize201706,by="PRACTICE") 

listsize201707 <- read.csv("2017_07_listsize.csv")[,c(6,10)] 
names(listsize201707) <- c("PRACTICE", "LIST.SIZE") 
data201707 <- ddply(data201707,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201707) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201707 <- merge(data201707,listsize201707,by="PRACTICE") 

listsize201708 <- read.csv("2017_08_listsize.csv")[,c(6,10)] 
names(listsize201708) <- c("PRACTICE", "LIST.SIZE") 
data201708 <- ddply(data201708,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201708) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201708 <- merge(data201708,listsize201708,by="PRACTICE") 

listsize201709 <- read.csv("2017_09_listsize.csv")[,c(6,10)] 
names(listsize201709) <- c("PRACTICE", "LIST.SIZE") 
data201709 <- ddply(data201709,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201709) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201709 <- merge(data201709,listsize201709,by="PRACTICE") 

listsize201710 <- read.csv("2017_10_listsize.csv")[,c(6,10)] 
names(listsize201710) <- c("PRACTICE", "LIST.SIZE") 
data201710 <- ddply(data201710,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201710) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201710 <- merge(data201710,listsize201710,by="PRACTICE") 

listsize201711 <- read.csv("2017_11_listsize.csv")[,c(6,10)] 
names(listsize201711) <- c("PRACTICE", "LIST.SIZE") 
data201711 <- ddply(data201711,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201711) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201711 <- merge(data201711,listsize201711,by="PRACTICE") 

listsize201712 <- read.csv("2017_12_listsize.csv")[,c(6,10)] 
names(listsize201712) <- c("PRACTICE", "LIST.SIZE") 
data201712 <- ddply(data201712,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201712) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201712 <- merge(data201712,listsize201712,by="PRACTICE") 

listsize201801 <- read.csv("2018_01_listsize.csv")[,c(6,10)] 
names(listsize201801) <- c("PRACTICE", "LIST.SIZE") 
data201801 <- ddply(data201801,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201801) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201801 <- merge(data201801,listsize201801,by="PRACTICE") 

listsize201802 <- read.csv("2018_02_listsize.csv")[,c(6,10)] 
names(listsize201802) <- c("PRACTICE", "LIST.SIZE") 
data201802 <- ddply(data201802,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201802) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201802 <- merge(data201802,listsize201802,by="PRACTICE") 

listsize201803 <- read.csv("2018_03_listsize.csv")[,c(6,10)] 
names(listsize201803) <- c("PRACTICE", "LIST.SIZE") 
data201803 <- ddply(data201803,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201803) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201803 <- merge(data201803,listsize201803,by="PRACTICE") 

listsize201804 <- read.csv("2018_04_listsize.csv")[,c(6,10)] 
names(listsize201804) <- c("PRACTICE", "LIST.SIZE") 
data201804 <- ddply(data201804,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201804) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201804 <- merge(data201804,listsize201804,by="PRACTICE") 

listsize201805 <- read.csv("2018_05_listsize.csv")[,c(6,10)] 
names(listsize201805) <- c("PRACTICE", "LIST.SIZE") 
data201805 <- ddply(data201805,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201805) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201805 <- merge(data201805,listsize201805,by="PRACTICE") 

listsize201806 <- read.csv("2018_06_listsize.csv")[,c(6,10)] 
names(listsize201806) <- c("PRACTICE", "LIST.SIZE") 
data201806 <- ddply(data201806,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201806) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201806 <- merge(data201806,listsize201806,by="PRACTICE") 

listsize201807 <- read.csv("2018_07_listsize.csv")[,c(6,10)] 
names(listsize201807) <- c("PRACTICE", "LIST.SIZE") 
data201807 <- ddply(data201807,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201807) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201807 <- merge(data201807,listsize201807,by="PRACTICE") 

listsize201808 <- read.csv("2018_08_listsize.csv")[,c(6,10)] 
names(listsize201808) <- c("PRACTICE", "LIST.SIZE") 
data201808 <- ddply(data201808,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201808) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201808 <- merge(data201808,listsize201808,by="PRACTICE") 

listsize201809 <- read.csv("2018_09_listsize.csv")[,c(6,10)] 
names(listsize201809) <- c("PRACTICE", "LIST.SIZE") 
data201809 <- ddply(data201809,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201809) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201809 <- merge(data201809,listsize201809,by="PRACTICE") 

listsize201810 <- read.csv("2018_10_listsize.csv")[,c(6,10)] 
names(listsize201810) <- c("PRACTICE", "LIST.SIZE") 
data201810 <- ddply(data201810,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201810) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201810 <- merge(data201810,listsize201810,by="PRACTICE") 

listsize201811 <- read.csv("2018_11_listsize.csv")[,c(6,10)] 
names(listsize201811) <- c("PRACTICE", "LIST.SIZE") 
data201811 <- ddply(data201811,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201811) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201811 <- merge(data201811,listsize201811,by="PRACTICE") 

listsize201812 <- read.csv("2018_12_listsize.csv")[,c(6,10)] 
names(listsize201812) <- c("PRACTICE", "LIST.SIZE") 
data201812 <- ddply(data201812,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201812) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201812 <- merge(data201812,listsize201812,by="PRACTICE") 

listsize201901 <- read.csv("2019_01_listsize.csv")[,c(6,10)] 
names(listsize201901) <- c("PRACTICE", "LIST.SIZE") 
data201901 <- ddply(data201901,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201901) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201901 <- merge(data201901,listsize201901,by="PRACTICE") 

listsize201902 <- read.csv("2019_02_listsize.csv")[,c(6,10)] 
names(listsize201902) <- c("PRACTICE", "LIST.SIZE") 
data201902 <- ddply(data201902,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201902) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201902 <- merge(data201902,listsize201902,by="PRACTICE") 

listsize201903 <- read.csv("2019_03_listsize.csv")[,c(6,10)] 
names(listsize201903) <- c("PRACTICE", "LIST.SIZE") 
data201903 <- ddply(data201903,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201903) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201903 <- merge(data201903,listsize201903,by="PRACTICE") 

listsize201904 <- read.csv("2019_04_listsize.csv")[,c(6,10)] 
names(listsize201904) <- c("PRACTICE", "LIST.SIZE") 
data201904 <- ddply(data201904,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201904) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201904 <- merge(data201904,listsize201904,by="PRACTICE") 

listsize201905 <- read.csv("2019_05_listsize.csv")[,c(6,10)] 
names(listsize201905) <- c("PRACTICE", "LIST.SIZE") 
data201905 <- ddply(data201905,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201905) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201905 <- merge(data201905,listsize201905,by="PRACTICE") 

listsize201906 <- read.csv("2019_06_listsize.csv")[,c(6,10)] 
names(listsize201906) <- c("PRACTICE", "LIST.SIZE") 
data201906 <- ddply(data201906,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201906) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201906 <- merge(data201906,listsize201906,by="PRACTICE") 

listsize201907 <- read.csv("2019_07_listsize.csv")[,c(6,10)] 
names(listsize201907) <- c("PRACTICE", "LIST.SIZE") 
data201907 <- ddply(data201907,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201907) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201907 <- merge(data201907,listsize201907,by="PRACTICE") 

listsize201908 <- read.csv("2019_08_listsize.csv")[,c(6,10)] 
names(listsize201908) <- c("PRACTICE", "LIST.SIZE") 
data201908 <- ddply(data201908,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201908) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201908 <- merge(data201908,listsize201908,by="PRACTICE") 

listsize201909 <- read.csv("2019_09_listsize.csv")[,c(6,10)] 
names(listsize201909) <- c("PRACTICE", "LIST.SIZE") 
data201909 <- ddply(data201909,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201909) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201909 <- merge(data201909,listsize201909,by="PRACTICE") 

listsize201910 <- read.csv("2019_10_listsize.csv")[,c(6,10)] 
names(listsize201910) <- c("PRACTICE", "LIST.SIZE") 
data201910 <- ddply(data201910,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201910) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201910 <- merge(data201910,listsize201910,by="PRACTICE") 

listsize201911 <- read.csv("2019_11_listsize.csv")[,c(6,10)] 
names(listsize201911) <- c("PRACTICE", "LIST.SIZE") 
data201911 <- ddply(data201911,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201911) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201911 <- merge(data201911,listsize201911,by="PRACTICE") 

listsize201912 <- read.csv("2019_12_listsize.csv")[,c(6,10)] 
names(listsize201912) <- c("PRACTICE", "LIST.SIZE") 
data201912 <- ddply(data201912,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
names(data201912) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
data201912 <- merge(data201912,listsize201912,by="PRACTICE") 

# listsize202001 <- read.csv("2020_01_listsize.csv")[,c(6,10)] 
# names(listsize202001) <- c("PRACTICE", "LIST.SIZE") 
# data202001 <- ddply(data202001,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202001) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202001 <- merge(data202001,listsize202001,by="PRACTICE") 
# 
# listsize202002 <- read.csv("2020_02_listsize.csv")[,c(6,10)] 
# names(listsize202002) <- c("PRACTICE", "LIST.SIZE") 
# data202002 <- ddply(data202002,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202002) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202002 <- merge(data202002,listsize202002,by="PRACTICE") 
# 
# listsize202003 <- read.csv("2020_03_listsize.csv")[,c(6,10)] 
# names(listsize202003) <- c("PRACTICE", "LIST.SIZE") 
# data202003 <- ddply(data202003,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202003) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202003 <- merge(data202003,listsize202003,by="PRACTICE") 
# 
# listsize202004 <- read.csv("2020_04_listsize.csv")[,c(6,10)] 
# names(listsize202004) <- c("PRACTICE", "LIST.SIZE") 
# data202004 <- ddply(data202004,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202004) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202004 <- merge(data202004,listsize202004,by="PRACTICE") 
# 
# listsize202005 <- read.csv("2020_05_listsize.csv")[,c(6,10)] 
# names(listsize202005) <- c("PRACTICE", "LIST.SIZE") 
# data202005 <- ddply(data202005,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202005) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202005 <- merge(data202005,listsize202005,by="PRACTICE") 
# 
# listsize202006 <- read.csv("2020_06_listsize.csv")[,c(6,10)] 
# names(listsize202006) <- c("PRACTICE", "LIST.SIZE") 
# data202006 <- ddply(data202006,.(PRACTICE_CODE, YEAR_MONTH),summarise,ITEMS = sum(QUANTITY),ACT.COST = sum(ACTUAL_COST))
# names(data202006) <- c("PRACTICE", "PERIOD", "ITEMS","ACT.COST") 
# data202006 <- merge(data202006,listsize202006,by="PRACTICE") 


# combine monthly datasets into single data frame and save

setwd(dirAnalysis)
alldata <- rbind(data201501,data201502,data201503,data201504,data201505,data201506,data201507,data201508,data201509,data201510,data201511,data201512,data201601,data201602,data201603,data201604,data201605,data201606,data201607,data201608,data201609,data201610,data201611,data201612,data201701,data201702,data201703,data201704,data201705,data201706,data201707,data201708,data201709,data201710,data201711,data201712,data201801,data201802,data201803,data201804,data201805,data201806,data201807,data201808,data201809,data201810,data201811,data201812,data201901,data201902,data201903,data201904,data201905,data201906,data201907,data201908,data201909,data201910,data201911,data201912)
write.csv(alldata,"allRxdata_filtered.csv",row.names = F)

# aggregate number of items and cost, and number of patients where period is the same (thus summing all prescriptions irrespective of practice)

alldata_sum <- ddply(alldata,.(PERIOD),summarise,ITEMS = sum(ITEMS),ACT.COST = sum(ACT.COST),LIST.SIZE = sum(LIST.SIZE))
alldata_sum$ITEMS.PER.1000 <- 1000*alldata_sum$ITEMS/alldata_sum$LIST.SIZE # calculate prescribing rate per 1000 registered patients
alldata_sum$time <- 1:nrow(alldata_sum) #add "time" starting at 1 from month 1
alldata_sum$year <- substr(alldata_sum$PERIOD,1,4) # add column of year (based on period)
alldata_sum$month <- substr(alldata_sum$PERIOD,5,6) # add column of month (based on period)
alldata_sum$intervention <- 0 #starts column of zeros for intervention dummy variable
alldata_sum$intervention[c(55:60)] <- 1 #add 1 to rows which are after intervention
write.csv(alldata_sum,"allRxData_filtered_aggregate.csv",row.names=F) 

## PLOTS & STATISTICS ------------------

# Read in data

rm(list=ls())
data <- read.csv("allRxData_filtered_aggregate.csv")

# Summary statistics
summary(data)

# View prescribing items / rates before and after intervention
summary(data$ITEMS[data$intervention==0])
summary(data$ITEMS[data$intervention==1])

summary(data$ITEMS.PER.1000[data$intervention==0])
summary(data$ITEMS.PER.1000[data$intervention==1])

## Quasi-Poisson regression model (including term for linear trend, but not seasonality)

# Poisson with the standardised population as an offset
model1 <- glm(ITEMS ~ offset(log(LIST.SIZE)) + intervention + time, family=quasipoisson, data)

summary(model1)
coef(model1) # view coefficients
ci.exp(model1) # view 95% confidence intervals of coefficients
round(ci.lin(model1,Exp=T),3)

# Save model outputs
out1a <- capture.output(summary(model1))
cat("Summary of unadjusted model", out1a, file="Results 1a. Summary of unadjusted model.txt", sep="\n", append=TRUE)
out1b <- capture.output(ci.exp(model1))
cat("CIs of unadjusted model", out1b, file="Results 1b. CIs of unadjusted model.txt", sep="\n", append=TRUE)

# Reform data frame with 0.1 time units to improve plotting
datanew <- data.frame(LIST.SIZE=mean(data$LIST.SIZE),intervention=rep(c(0,1),c(550,50)), # months before and months after x 10
                      time= 1:600/10,month=rep(1:120/10,5))
datanew <- datanew[1:600,]

# Generate predicted values based on the model in order to create a plot
pred1 <- predict(model1,type="response",data)/mean(data$LIST.SIZE)*10^3

# Plot
plot(data$ITEMS.PER.1000,type="n",ylim=c(00,300),xlab="Year",ylab="Items per 1000 registered patients",
     bty="l",xaxt="n")
rect(55,00,60,300,col=grey(0.9),border=F)
points(data$ITEMS.PER.1000,cex=0.7)
axis(1,at=0:4*12,labels=F)
axis(1,at=0:4*12,tick=F,labels=2015:2019)
lines((1:60),pred1,col=2)
title("Prescribing rate, 2015-2019")

# Create and plot the counterfactual
datanew <- data.frame(LIST.SIZE=mean(data$LIST.SIZE),intervention=0,time=1:600/10,
                      month=rep(1:120/10,5))
datanew <- datanew[1:600,]
pred1b <- predict(model1,datanew,type="response")/mean(data$LIST.SIZE)*10^3
lines(datanew$time,pred1b,col=4,lty=2)


# return the data frame to the scenario including the intervention
datanew <- data.frame(LIST.SIZE=mean(data$LIST.SIZE),intervention=rep(c(0,1),c(550,50)), # months before and months after x 10
                      time= 1:600/10,month=rep(1:120/10,5))
datanew <- datanew[1:600,]

###

# Adjusting for seasonality as well as linear trend
# Use harmonic terms specifying the number of sin and cosine pairs to include: 2 pairs with period 12
model2 <- glm(ITEMS ~ offset(log(LIST.SIZE)) + intervention + time +
                harmonic(month,2,12), family=quasipoisson, data)
summary(model2)
coef(model2)
ci.exp(model2)
round(ci.lin(model2,Exp=T),3)

# Save model summary
out2a <- capture.output(summary(model2))
cat("Summary of seasonally adjusted model", out2a, file="Results 2a. Summary of seasonally adjusted model.txt", sep="\n", append=TRUE)
out2b <- capture.output(ci.exp(model2))
cat("CIs of seasonally adjusted model", out2b, file="Results 2b. CIs of seasonally adjusted model.txt", sep="\n", append=TRUE)

# Plot seasonally adjusted model
pred2 <- predict(model2,type="response",datanew)/mean(data$LIST.SIZE)*10^3
plot(data$ITEMS.PER.1000,type="n",ylim=c(00,300),xlab="Year",ylab="Items per 1000 registered patients",
     bty="l",xaxt="n")
rect(55,00,60,300,col=grey(0.9),border=F)
points(data$ITEMS.PER.1000,cex=0.7)
axis(1,at=0:4*12,labels=F)
axis(1,at=0:4*12,tick=F,labels=2015:2019)
lines(1:600/10,pred2,col=2)
title("Prescribing rate, 2015-2019")

# Predict and plot the deseasonalised trend
pred2b <- predict(model2,type="response",transform(datanew,month=6))/
  mean(data$LIST.SIZE)*10^3
lines(1:660/10,pred2b,col=3,lty=2)

# Save plots

Cairo(file="Figure 1. Unadjusted model with counterfactual.png", 
      type="png",
      units="in", 
      width=5, 
      height=4, 
      pointsize=10, 
      dpi=1200)

plot(data$ITEMS.PER.1000,type="n",ylim=c(00,300),xlab="Year",ylab="Items per 1000 registered patients",
     bty="l",xaxt="n")
rect(55,00,60,300,col=grey(0.9),border=F)
points(data$ITEMS.PER.1000,cex=0.7)
axis(1,at=0:4*12,labels=F)
axis(1,at=0:4*12,tick=F,labels=2015:2019)
lines((1:60),pred1,col=2, lwd=0.6)
title("Prescribing rate, 2015-2019")

# Create and plot the counterfactual
datanew <- data.frame(LIST.SIZE=mean(data$LIST.SIZE),intervention=0,time=1:600/10,
                      month=rep(1:120/10,5))
datanew <- datanew[1:600,]
pred1b <- predict(model1,datanew,type="response")/mean(data$LIST.SIZE)*10^3
lines(datanew$time,pred1b,col=4,lty=2,lwd=0.6)

dev.off()


Cairo(file="Figure 2. Model adjusted for seasonality.png", 
      type="png",
      units="in", 
      width=5, 
      height=4, 
      pointsize=10, 
      dpi=1200)

plot(data$ITEMS.PER.1000,type="n",ylim=c(00,300),xlab="Year",ylab="Items per 1000 registered patients",
     bty="l",xaxt="n")
rect(55,00,60,300,col=grey(0.9),border=F)
points(data$ITEMS.PER.1000,cex=0.7)
axis(1,at=0:4*12,labels=F)
axis(1,at=0:4*12,tick=F,labels=2015:2019)
lines(1:600/10,pred2,col=2, lwd=0.6)
title("Prescribing rate, 2015-2019")
lines(1:600/10,pred2b,col=3,lty=2, lwd=0.6)

dev.off()


## REFERENCE ----------------

# Bernal JL et al. Interrupted time series regression for the evaluation of public health interventions: a tutorial. Int J Epidemiol 2017;36:348-355