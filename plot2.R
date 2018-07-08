# function plot2.R
# creates plot2.png
plot2 <- function()
  
{
  dados <- read.csv("household_power_consumption.txt", sep=';')

  dadosok <- subset(dados, (dados$Date=='1/2/2007' | dados$Date=='2/2/2007'))
  # remove tabela completa
  rm(dados)
  # ajusta dados
  dadosok[,3] <- as.numeric(as.character(dadosok[,3] ))

  tab <- data.frame(dh = as.POSIXct(paste(strptime(dadosok$Date, 
                format='%d/%m/%Y'), dadosok$Time)), 
                pot = dadosok$Global_active_power)
#
  with(tab,plot(dh, pot, type='l', lwd=1, cex.lab =0.8, cex.axis=0.8, 
              ylab='Global Active Power (kilowatts)', xlab=''))
 
# copia para arquivo PNG
  dev.copy(png,file='plot2.png')
  dev.off()
 
}

#  ////
# source("plot2.R")
# plot2()
