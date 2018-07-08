# function plot4.R
# creates plot4.png
plot4 <- function()

{
  dados <- read.csv("household_power_consumption.txt", sep=';')
  dadosok <- subset(dados, (dados$Date=='1/2/2007' | dados$Date=='2/2/2007'))
# remove tabela completa
  rm(dados)
# ajusta dados
  dadosok[,3] <- as.numeric(as.character(dadosok[,3] ))
  dadosok[,4] <- as.numeric(as.character(dadosok[,4] ))
  dadosok[,5] <- as.numeric(as.character(dadosok[,5] ))
  dadosok[,7] <- as.numeric(as.character(dadosok[,7] ))
  dadosok[,8] <- as.numeric(as.character(dadosok[,8] ))
  dadosok[,9] <- as.numeric(as.character(dadosok[,9] ))

  tab <- data.frame(dh = as.POSIXct(paste(strptime(dadosok$Date, 
                format='%d/%m/%Y'), dadosok$Time)), 
                sm1 = dadosok$Sub_metering_1,
                sm2 = dadosok$Sub_metering_2,
                sm3 = dadosok$Sub_metering_3,
                gap = dadosok$Global_active_power,
                grp = dadosok$Global_reactive_power,
                vol = dadosok$Voltage)

#
# Define mfrow()
par(mfrow=c(2,2), mar=c(4,4,3,2))
#

# Geração de Graficos
#
# q1
#
with(tab, plot(dh, gap, type='l', lwd=1, cex.lab =0.9, cex.axis=0.9, 
              ylab='Global Active Power', xlab=''))

# q2
#
with(tab, plot(dh, vol, type='l', lwd=1, cex.lab =0.9, cex.axis=0.9, 
               ylab='Voltage', xlab='datetime'))

# q3
#
with(tab,plot(dh, sm1, type='l', lwd=1, cex.lab =0.9, cex.axis=0.9, 
              ylab='Energy sub metering', xlab=''))
with(tab,points(dh, sm2, type='l', lwd=1, col='red'))
with(tab,points(dh, sm3, type='l', lwd=1, col='blue'))
#
legend('topright', pch=c('_','_','_'), col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       bty='n', cex=0.7, y.intersp=0.8, pt.cex=2)
#
# q4
#
with(tab, plot(dh, grp, type='l', lwd=1, cex.lab =0.9, cex.axis=0.9, 
               ylab='Global_reactive_power', xlab='datetime'))
#
# copia para arquivo PNG
dev.copy(png,file='plot4.png')
dev.off()
#


}



#
#  ////
# source("plot4.R")
# plot4()

