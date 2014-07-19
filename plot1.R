cur_dir = "C:/dev/R/Coursera/Proj2" #working directory where .rds files are located
setwd(cur_dir)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

df.tot.emiss <- aggregate(NEI[, "Emissions"], list(Year = NEI$year), FUN = "sum")


png("plot1.png", height = 480, width = 480)
plot(df.tot.emiss, type ="b", lty = 3, ylab = "Total Emissions", yaxt="n")
axis(2, axTicks(2), format(axTicks(2), scientific = F))
dev.off()






