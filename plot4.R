cur_dir = "C:/dev/R/Coursera/Proj2" #working directory where .rds files are located
setwd(cur_dir)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_indx <- SCC[grep("coal", SCC$"Short.Name", ignore.case=T),"SCC"]
NEI.Coal <- NEI[NEI$SCC %in% coal_indx,]

df.tot.emiss <- aggregate(NEI.Coal[, "Emissions"], list(Year = NEI.Coal$year), FUN = "sum")


library(ggplot2)
library(scales)
gg <- ggplot(df.tot.emiss, aes(x = Year, y = x)) + geom_line() + scale_y_continuous(name="Total Emissions", labels = comma) 
gg <- gg + ggtitle("National Coal Combustion")
#print(gg)

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()


