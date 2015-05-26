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
as.vector(unlist(ziptx), mode = "numeric")

zipcom <- data.frame(com$Zip)
as.vector(unlist(zipcom), mode = "numeric")

Texas <- vector()
ext <- vector()

## Method A
for (i in 1:nrow(zipcom)){
  if(((as.numeric(zipcom[i,]) %in% unlist(ziptx))) == TRUE){
    Texas[i] <- as.numeric(zipcom[i,])
  }
  else if(((as.numeric(zipcom[i,]) %in% unlist(ziptx))) == FALSE){
    ext[i] <- as.numeric(zipcom[i,])
  }
}

## Method B
texas2 <- zipcom[match(zipcom, ziptx),]

## Method C
texas3 <- subset(zipcom, zipcom %in% ziptx)
row.names(texas3) <- NULL




# # Testing
# v <- c("a", "b", "c", "d")
# 
# "d" %in% v





