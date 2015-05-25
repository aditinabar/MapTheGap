setwd("C:/Users/naditi/Projects/MapTheGap/Community/Data/")
zip <- read.table("US Zipcodes.csv", sep = ",", header = TRUE, stringsAsFactor = TRUE)

zip[,which(colnames(zip) == "world_region")] <- NULL
zip[,which(colnames(zip) == "timezone")] <- NULL
zip[,which(colnames(zip) == "county")] <- NULL
zip[,which(colnames(zip) == "area_codes")] <- NULL

zip <- zip[zip$type=="STANDARD",]
row.names(zip) <- NULL

tx <- zip[zip$state == "TX",]
row.names(tx) <- NULL


setwd("C:/Users/naditi/Projects/MapTheGap/Community/Data/Clean")
com <- read.table("Community.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE)

View(zip)
View(com)

ziptx <- data.frame(tx$zip)
as.character(ziptx)

zipcom <- data.frame(com$Zip)
as.character(zipcom)

Texas <- vector()
ext <- vector()

for (i in 1:nrow(zipcom)){
  if(((as.numeric(zipcom[i,]) %in% unlist(ziptx))) == TRUE){
    Texas[i] <- as.numeric(zipcom[i,])
  }
  else if(((as.numeric(zipcom[i,]) %in% unlist(ziptx))) == FALSE){
    ext[i] <- as.numeric(zipcom[i,])
  }
}

cont <- data.frame(cont)

View(cont)

v <- c("a", "b", "c", "d")

"d" %in% v





