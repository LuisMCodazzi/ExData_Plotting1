# function plot1.R
# creates plot1.png
plot1 <- function()
  
{
  

dados <- read.csv("household_power_consumption.txt", sep=';')

dadosok <- subset(dados, (dados$Date=='1/2/2007' | dados$Date=='2/2/2007'))
# removes complete table
rm(dados)
# adjusts data
dadosok[,3] <- as.numeric(as.character(dadosok[,3] ))

hist(dadosok$Global_active_power, col='red', main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', cex.lab =0.8, cex.axis=0.8, cex.main=1)

# copy to PNG file
 dev.copy(png,file='plot1.png')
 dev.off()

}

#  ////
# source("plot1.R")
# plot1()


