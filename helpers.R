convb <- function(x){
  ptn <- "(\\d*(.\\d+)*)(.*)"
  num  <- as.numeric(sub(ptn, "\\1", x))
  unit <- sub(ptn, "\\3", x)             
  unit[unit==""] <- "1" 
  
  mult <- c("1"=1, "K"=1024, "M"=1024^2, "G"=1024^3)
  num * unname(mult[unit])
}

getelapsed <- function(x){
  str<-unlist(strsplit(as.character(x),'[-:]'))
  secs = 0
  if (length(str)==4) {
    secs <- as.numeric(str[1])*86400
    secs <- secs + as.numeric(str[2])*3600
    secs <- secs + as.numeric(str[3])*60
    secs <- secs + as.numeric(str[4])
  } else if (length(str)==3) {
    secs <- as.numeric(str[1])*3600
    secs <- secs + as.numeric(str[2])*60
    secs <- secs + as.numeric(str[3])
  }
  return(secs)
}

convram <- function(reqram,alloccpu){
  if (str_sub(reqram,-2,-2)=="M") {
   if (str_sub(reqram,-1,-1)=="c") {
     ram <- strtoi(str_sub(reqram,1,-3)) * alloccpu / 1000
   } else if (str_sub(reqram,-1,-1)=="n") {
     ram <- strtoi(str_sub(reqram,1,-3)) / 1000
   }
  } else if (str_sub(reqram,-2,-2)=="G") {
   if (str_sub(reqram,-1,-1)=="c") {
     ram <- strtoi(str_sub(reqram,1,-3)) * alloccpu
   } else if (str_sub(reqram,-1,-1)=="n") {
     ram <- strtoi(str_sub(reqram,1,-3))
   }
  }
  return(ram)
}
