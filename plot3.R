# function plot3.R
# creates plot3.png
plot3 <- function()
  
{
  dados <- read.csv("household_power_consumption.txt", sep=';')
  dadosok <- subset(dados, (dados$Date=='1/2/2007' | dados$Date=='2/2/2007'))
# remove tabela completa
  rm(dados)
# ajusta dados
  dadosok[,3] <- as.numeric(as.character(dadosok[,3] ))
  dadosok[,7] <- as.numeric(as.character(dadosok[,7] ))
  dadosok[,8] <- as.numeric(as.character(dadosok[,8] ))
  dadosok[,9] <- as.numeric(as.character(dadosok[,9] ))

  tab <- data.frame(dh = as.POSIXct(paste(strptime(dadosok$Date, 
                format='%d/%m/%Y'), dadosok$Time)), 
                sm1 = dadosok$Sub_metering_1,
                sm2 = dadosok$Sub_metering_2,
                sm3 = dadosok$Sub_metering_3)
#
  with(tab,plot(dh, sm1, type='l', lwd=1, cex.lab =0.8, cex.axis=0.8, 
              ylab='Energy sub metering', xlab=''))
  with(tab,points(dh, sm2, type='l', lwd=1, col='red'))
  with(tab,points(dh, sm3, type='l', lwd=1, col='blue'))

  legend('topright', pch=c('_','_','_'), col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       cex=0.8, y.intersp=0.9, pt.cex=2, xjust=1)

# copia para arquivo PNG
  dev.copy(png,file='plot3.png')
  dev.off()

}

#  ////
# source("plot3.R")
# plot3()
