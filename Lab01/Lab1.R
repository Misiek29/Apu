##A
a = 20*log10(100)
b = 3*a
pmin(a,b)

##C
x <- 80:105
suma = sum(x^2)

##D
apropos("round")

##E
setwd("F:/MAGAZYN/ATH/MAGISTERKA/Uczenie maszynowe/Repo/Lab01")
a <- "pralka"
write(a, file='pkt_e.csv')
rm(a)
a
a <- read.csv(file = 'pkt_e.csv', sep = ',')
a

#f)
install.packages("gridExtra")
library("gridExtra")
g <- tableGrob(trees)
grid.arrange(g)

##G
y <- seq(from = 1400, to = 1200, by = -5)

##H
h1 <- 15:3
h2 <- 24:53 
h3 <-c(h1,h2)
h3

##I
nazwy <- c('Bosch WAE2026EP', 'Candy Smart GVS34','Whirlpool FSCR 80421',
           'Electrolux EW7F348SP PerfectCare', 'Miele WDB 030 WCS Eco', 'Indesit IWSC 51052 C ECO PL',
           'Bosch WAB20264PL Serie 2 VarioPerfect', 'Bosch WLT24460PL Serie 6 VarioPerfect', 'Samsung AddWash Slim WW60K42109W',
           'Amica DAW 6103 LSW', 'Electrolux EW6S306SPX', 'Samsung WW70J4273MW', 'Candy Smart CS4 1061D3', 'Indesit Eco Time IWD 61052 C ECO PL', 'Bosch WAB24264PL Serie 2 VarioPerfect')
pojemnosc <- c(7, 6, 8, 8, 7, 5, 6,6,6,5,6,6,6,7,6)

predkosc_wirowania <- c(1000, 1200, 1400, 1400, 1400, 1000, 1000, 1200, 1200, 1200,1000,1000,1200,1000,1200)
cena<- c(1199, 1399,1599, 2099, 3689, 799, 999, 1349, 1649, 1649,1099,1599,1299,999,799)
liczba_opinii <- c(154, 162, 10, 44, 18, 549, 250, 250, 525, 82,115,13,90,156,287)
pralki <- data.frame(nazwy, pojemnosc, predkosc_wirowania, cena, liczba_opinii)

mean(pralki$cena)

##J
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=6, predkosc_wirowania=1000, cena= 1299, liczba_opinii=43) 
                     
pralki <- rbind(pralki, newRow)
mean(pralki$cena)                        

#K
pralki$ocena <- c('5', '5', '4', '5', '5', '5', '5', '5', '5', '5', '5', '5','5','5','5','5')
aggregate(pralki$cena, list(pralki$ocena), mean)

#L
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=6, predkosc_wirowania=1000, cena= 1299, liczba_opinii=114, ocena='5') 

pralki <- rbind(pralki, newRow)
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=7, predkosc_wirowania=1200, cena= 1399, liczba_opinii=43, ocena='4') 

pralki <- rbind(pralki, newRow)
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=5, predkosc_wirowania=1000, cena= 1799, liczba_opinii=72, ocena='5') 

pralki <- rbind(pralki, newRow)
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=5, predkosc_wirowania=1400, cena= 1299, liczba_opinii=34, ocena='4,5') 

pralki <- rbind(pralki, newRow)
newRow <- data.frame(nazwy = 'LG FE0J5NN3W', pojemnosc=6, predkosc_wirowania=1200, cena= 1499, liczba_opinii=18, ocena='5') 

pralki <- rbind(pralki, newRow)

dane <- aggregate(pralki$liczba_opinii, list(pralki$ocena), sum)
barplot(dane[,2], names.arg = dane[,1], main = 'Liczba reprezentantow kazdej z ocen')

#M
labels <- round(dane[,2]/sum(dane[,2]) * 100, 1)
labels <- paste(labels, "%", sep="")
pie(dane[,2], radius = 1, col = rainbow(length(dane[,2])),
    labels = labels)
legend(1.6, 0.8, dane[,1], cex=0.8, fill=rainbow(length(dane[,2])))

#N)
new_column <- ifelse(pralki$liczba_opinii>100,'wiecej 100 opinii', 
                     ifelse(pralki$liczba_opinii>=50, '50-100 opinii',
                            ifelse(pralki$liczba_opinii>0, 'mniej 50 opinii', 'nie ma')))
pralki['status_opinii'] <- factor(new_column)

#wykres kolowy
pie(table(pralki$status_opinii), radius = 1, col = rainbow(length(pralki$status_opinii)))

install.packages("plotrix")
library(plotrix)
percentage <- table(pralki$ocena) / length(pralki$ocena)
fan.plot(percentage, labels = names(percentage), main = "Procentowy udział oceny")

#O)
for (i in 1:length(pralki$nazwy)){
  print(paste(pralki$nazwy[i], 'ma ocene klientew', pralki$ocena[i], 'bo ma liczbe opinii',
              pralki$liczba_opinii[i]))
}

#P)
write.csv(pralki, 'pralki.csv')
dane <- read.csv('pralki.csv')
