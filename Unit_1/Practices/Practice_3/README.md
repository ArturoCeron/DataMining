# Practica 3

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

``` R
#Monthly Ravenue
MR <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)

#expenses for the financial year
EFY <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Tax 30% = 0.3 
TAX <- (0.3)

#After Tax
ATAX <- (1-TAX)

#Profit
P <- MR - EFY

#Profit after tax
PAT <- P*ATAX

# profit margin for each month
PMEM <- PAT / MR

# Convert to %
PMEM <- round(PMEM * 100,2)

#Mean profit after tax
MPAT<-mean(PAT)

# good months - where the profit after tax was greater than the mean for the year
# bad months - where the profit after tax was less then the mean for years
GM<-c()
BdM<-c()
for(x in PAT){
  if(x>=MPAT){
    GM<-c(GM, x)
  }else{
    BdM<-c(BdM, x)
  }
}

# the best month - where the profit after tax was max for the year
# the worst month - where the profit after tax was min for the year
BM<-max(PAT)
WM<-min(PAT)

#Convert data
MRK<-round(MR/ 1000,0)
EFYK<-round(EFY/ 1000,0)
PK<-round(P/1000,0)
PATK<-round(PAT/1000,0)
GM<-round(GM/1000,0)
BdM<-round(BdM/1000,0)
BM<-round(BM/1000,0)
WM<-round(WM/1000,0)
#Print Results
MRK
EFYK
PK
PATK
PMEM
GM
BdM
BM
WM
```