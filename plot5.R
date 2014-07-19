cur_dir = "C:/dev/R/Coursera/Proj2" #working directory where .rds files are located
setwd(cur_dir)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor_indx <- SCC[grep("vehicles", SCC$"Short.Name", ignore.case=T),"SCC"]

NEI.Baltimore <- subset(NEI, fips == "24510" & SCC %in% motor_indx) # Baltimore City, Maryland (fips == "24510")

df.tot.emiss <- aggregate(NEI.Baltimore[, "Emissions"], list(Year = NEI.Baltimore$year), FUN = "sum")


library(ggplot2)
library(scales)
gg <- ggplot(df.tot.emiss, aes(x = Year, y = x)) + geom_line() + scale_y_continuous(name="Total Emissions", labels = comma) 
gg <- gg + ggtitle("Baltimore City,  Motor Vehicle Sources")
#print(gg)

dev.copy(png,'plot5.png', width = 480, height = 480)
dev.off()

