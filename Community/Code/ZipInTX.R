setwd("C:/Users/naditi/Projects/MapTheGap/Community/Data/")
US <- read.table("US Zipcodes.csv", sep = ",", header = TRUE, stringsAsFactor = TRUE)

US[,which(colnames(US) == "world_region")] <- NULL
US[,which(colnames(US) == "timezone")] <- NULL
US[,which(colnames(US) == "county")] <- NULL
US[,which(colnames(US) == "area_codes")] <- NULL

zip <- US[US$type=="STANDARD",]
row.names(zip) <- NULL

tx <- zip[zip$state == "TX",]
row.names(tx) <- NULL


setwd("C:/Users/naditi/Projects/MapTheGap/Community/Data/Clean")
com <- read.table("Community.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE)

## Winning Method 

texas2 <- com[com$zip %in% tx$zip,]

# 
# ziptx <- as.vector(tx$zip)
# #as.vector(unlist(ziptx), mode = "numeric")
# 
# zipcom <- as.vector(com$Zip)
# #as.vector(unlist(zipcom), mode = "numeric")
# 
# Texas <- vector()
# ext <- vector()

# ## Method A
# for (i in 1:1849){
#   if((zipcom[i] %in% ziptx) == "TRUE"){
#     print(zipcom[i])
#     Texas[i] <- zipcom[i]
#   }
#   else if(((as.numeric(zipcom[i]) %in% unlist(ziptx))) == "FALSE"){
#     ext[i] <- as.numeric(zipcom[i])
#   }
# }



# Testing
v <- c("a", "b", "c", "d")

"d" %in% v




