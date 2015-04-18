setwd("/Users/naditi/Projects/MapTheGap/Community/Data/Clean")

#EM <- read.table("ACS_13_5YR_DP05_with_ann_EthnicMakeup_CLEAN.csv", sep = ",", header = TRUE, )

header <- read.table('ACS_13_5YR_DP05_with_ann_EthnicMakeup_CLEAN.csv', 
                     nrows = 1, 
                     header = FALSE, 
                     sep =',', 
                     stringsAsFactors = FALSE)
EM   <- read.table('ACS_13_5YR_DP05_with_ann_EthnicMakeup_CLEAN.csv', 
                   skip = 2, 
                   header = FALSE, 
                   sep =',')
colnames(EM) <- unlist(header)

povMIEM <- merge(MIpov, EM, by.x = "Zip", by.y = "Zip")

colnames(povMIEM)[2:3] <- c("POV_Pct_AllFam", "POV_PctM_AllFam")
names(povMIEM)[8:15] <- c("EM_est_total", "EM_moe_total", "EM_pct_total", "EM_pctm_total", 
                          "EM_est_hisp_anyrace", "EM_moe_hisp_anyrace", "EM_pct_hisp_anyrace", 
                          "EM_pctm_hisp_anyrace_total")
names(povMIEM)[16:23] <- c("EM_est_nothisp", "EM_moe_nothisp", 
                           "EM_pct_nothisp", "EM_pctm_nothisp", 
                           "EM_est_nothisp_whitealone", "EM_moe_nothisp_whitealone", 
                           "EM_pct_nothisp_whitealone", "EM_pctm_nothisp_whitealone")
names(povMIEM)[24:31] <- c("EM_est_nothisp_AAalone", "EM_moe_nothisp_AAalone", 
                           "EM_pct_nothisp_AAalone", "EM_pctm_nothisp_AAalone", 
                           "EM_est_nothisp_AIalone", "EM_moe_nothisp_AIalone", 
                           "EM_pct_nothisp_AIalone", "EM_pctm_nothisp_AIalone")
names(povMIEM)[32:39]<- c("EM_est_nothisp_Asianalone", "EM_moe_nothisp_Asianalone", 
                          "EM_pct_nothisp_Asianalone", "EM_pctm_nothisp_Asianalone", 
                          "EM_est_nothisp_PacificIsl.alone", "EM_moe_nothisp_PacificIsl.alone", 
                          "EM_pct_nothisp_PacificIsl.alone", "EM_pctm_nothisp_PacificIsl.alone")
names(povMIEM)[40:47] <- c("EM_est_nothisp_oneother", "EM_moe_nothisp_oneother", 
                           "EM_pct_nothisp_oneother", "EM_pctm_nothisp_oneother", 
                           "EM_est_nothisp_twoplus", "EM_moe_nothisp_twoplus", 
                           "EM_pct_nothisp_twoplus", "EM_pctm_nothisp_twoplus")

Zip <- povMIEM$Zip

#problem with line 42: as.numeric not running. povMIEM1 is now all character values
povMIEM1 <- apply(povMIEM, 2, function(x) as.numeric(gsub("\\*\\*", NA, x)))
#povMIEM1[,1] <- Zip

#Percent Margin of Error; HISPANIC OR LATINO AND RACE - Total population - Not Hispanic or Latino - Some other race alone

#write.csv(povMIEM, "povMIEM.csv", row.names = FALSE)
