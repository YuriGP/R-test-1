install.packages("ggplot2")
library(ggplot2)
require(scales) # for removing scientific notation

path <- "path/to/project/folder"

numFiles <- 7
data <- data.frame(row.names=c("hhmm", "count"))

i <- 0
for (i in 0:(numFiles-1)) {
  fileName <- paste0("output/part-0000", i)
  filePath <- paste0(path, fileName)
  output <- read.table(file=filePath, sep="\t", comment.char="", col.names=c("hhmm", "count"), colClasses=c("character", "integer"))
  data <- rbind(data, output)
}

data <- data[order(data$hhmm),]

graphic <- ggplot(data, aes(x = hhmm, y = count, group = 1)) + geom_line()
graphic <- graphic + scale_y_continuous(labels = comma)
graphic <- graphic + scale_x_discrete(breaks = c("0000","0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300","2400"))
graphic <- graphic + theme(axis.text.x=element_text(angle=45))
graphic
