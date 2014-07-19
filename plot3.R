cur_dir = "C:/dev/R/Coursera/Proj2" #working directory where .rds files are located
setwd(cur_dir)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
NEI.Baltimore <- subset(NEI,fips == "24510") # Baltimore City, Maryland (fips == "24510")
SCC <- readRDS("Source_Classification_Code.rds")

df.tot.emiss <- aggregate(NEI.Baltimore[, "Emissions"], list(Year = NEI.Baltimore$year, Type = NEI.Baltimore$type), FUN = "sum")


library(ggplot2)
library(scales)
gg <- ggplot(df.tot.emiss, aes(x = Year, y = x)) + geom_line() + scale_y_continuous(name="Total Emissions", labels = comma) 
gg <- gg + ggtitle("Baltimore City, Maryland")
gg <- gg + facet_wrap(~Type)

dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()

#print(gg)

