setwd("/Users/naditi/Projects/MapTheGap/Community/Data/Clean")

pov <- read.table("Poverty_Clean.csv", sep = ",", skip = 2, 
                  col.names = c("Zip", "Pct_AllFam", "PctM_AllFam", "Pct_MarC", "PctM_MarC", 
                                "Pct_Fem", "PctM_Fem", "Pct_SingMom", "PctM_SingMom"), stringsAsFactors = FALSE)

MI <- read.table("MedInc_Clean.csv", sep =",",
                 col.names = c("zip", "TotalHH", "TotalHHM", "MedInc", "MedIncM"), stringsAsFactors = FALSE)



MIpov <- merge(pov, MI, by.x = "Zip", by.y = "zip")

rep <- gsub("\\*\\*", NA, MIpov$PctM_AllFam)
rep <- as.numeric(rep)
MIpov$PctM_AllFam <- rep

rep <- gsub("\\*\\*", NA, MIpov$PctM_MarC)
rep <- as.numeric(rep)
MIpov$PctM_MarC <- rep

rep <- gsub("\\*\\*", NA, MIpov$PctM_Fem)
rep <- as.numeric(rep)
MIpov$PctM_Fem <- rep

rep <- gsub("\\*\\*", NA, MIpov$PctM_SingMom)
rep <- as.numeric(rep)
MIpov$PctM_SingMom <- rep

rep <- gsub("\\*\\*", NA, MIpov$TotalHHM)
rep <- as.numeric(rep)
MIpov$TotalHHM <- rep

rep <- gsub("\\*\\*", NA, MIpov$MedIncM)
rep <- as.numeric(rep)
MIpov$MedIncM <- rep


View(MIpov)

MIpov$Pct_MarC <- NULL
MIpov$PctM_MarC <- NULL
MIpov$Pct_Fem <- NULL
MIpov$PctM_Fem <- NULL
MIpov$Pct_SingMom <- NULL
MIpov$PctM_SingMom <- NULL

#write to CSV

