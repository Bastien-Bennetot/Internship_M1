#important


tab <-read.csv( file = "observations.csv")
tab<-subset(tab, kingdom == "Fungi")
tab<-subset(tab, phylum == "Basidiomycota" )
tab<-subset(tab, family == "Amanitaceae" )
tab<-subset(tab, genus == "Amanita" )
tab<-droplevels(tab)

write.csv(tab, file = "naturalist_amanita.csv")



mp <- NULL
mapWorld <- borders("world", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(aes(x =tab[,20], y =tab[,19]), size=1,pch=20) 
mp

dev.copy(png,'myplot.png', width=1920,height=1080)
dev.off()



########################################################################################

setwd("~/Bureau/STAGE M1 IMPORTANT/algo")

library(ggplot2)
`%ni%` <- Negate(`%in%`) 

amanita <-read.csv( file = "naturalist_amanita.csv")
amanita$X<-NULL


amanita_usa<-amanita
amanita_usa<-amanita_usa[amanita_usa$decimalLatitude>25,]
amanita_usa<-amanita_usa[amanita_usa$decimalLatitude<50,]
amanita_usa<-amanita_usa[amanita_usa$decimalLongitude< -67,]
amanita_usa<-amanita_usa[amanita_usa$decimalLongitude> -130,]
amanita_usa<-droplevels(amanita_usa)

amanita_usa_E<-amanita_usa[amanita_usa$decimalLongitude> -100,]
amanita_usa_W<-amanita_usa[amanita_usa$decimalLongitude< -100,]
amanita_usa_E<-droplevels(amanita_usa_E)
amanita_usa_W<-droplevels(amanita_usa_W)



mp <- NULL
mapWorld <- borders("world", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(data=amanita, aes(x = decimalLongitude, y= decimalLatitude), size=1,pch=20,color="red") 
mp <-mp + geom_path(data=amanita, aes(x = decimalLongitude, y= decimalLatitude), size=0.05)
## or....
#p + geom_line(data=d, aes(x=lon, y=lat), color="black", size=1)
mp




mp <- NULL
mapWorld <- borders("world", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(data=amanita, aes(x = decimalLongitude, y= decimalLatitude), size=1,pch=20,color="red") 

for ( i in levels(amanita$scientificName) ) 
{
  mp <-mp + geom_path(data=subset(amanita, scientificName==i), aes(x = decimalLongitude, y= decimalLatitude), size=0.05)
}
  ## or....
#p + geom_line(data=d, aes(x=lon, y=lat), color="black", size=1)
mp

#west draw
mp <- NULL
mapWorld <- borders("world", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(data=amanita, aes(x = decimalLongitude, y= decimalLatitude), size=1,pch=20,color="red") 

for ( i in levels(amanita$scientificName) ) 
{
  mp <-mp + geom_path(data=subset(amanita[amanita$id%ni%amanita_usa_E$id,], scientificName==i), aes(x = decimalLongitude, y= decimalLatitude), size=0.05)
}
## or....
#p + geom_line(data=d, aes(x=lon, y=lat), color="black", size=1)
mp
dev.copy(png,'west_linkage_naturalist.png', width=1920,height=1080)
dev.off()

#east draw
mp <- NULL
mapWorld <- borders("world", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(data=amanita, aes(x = decimalLongitude, y= decimalLatitude), size=1,pch=20,color="red") 

for ( i in levels(amanita$scientificName) ) 
{
  mp <-mp + geom_path(data=subset(amanita[amanita$id%ni%amanita_usa_W$id,], scientificName==i), aes(x = decimalLongitude, y= decimalLatitude), size=0.05)
}
## or....
#p + geom_line(data=d, aes(x=lon, y=lat), color="black", size=1)
mp

dev.copy(png,'east_linkage_naturalist.png', width=1920,height=1080)
dev.off()



mp <- NULL
mapWorld <- borders("usa", colour="grey50", fill="grey50" ) # create a layer of borders
mp <- ggplot() +   mapWorld
#Now Layer the observations
mp <- mp+ geom_point(aes(x =amanita_usa[,20], y =amanita_usa[,19]), size=1,pch=20) 
mp



length(levels(amanita_usa_E$scientificName))/nrow(amanita_usa_E)
length(levels(amanita_usa_W$scientificName))/nrow(amanita_usa_W)


length(levels(amanita_usa_W$scientificName))
length(levels(amanita_usa_E$scientificName))


length(setdiff(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName)))
setdiff(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName))

length(union(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName)))
union(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName))

length(intersect(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName)))
intersect(x = levels(amanita_usa_E$scientificName) , y=levels(amanita_usa_W$scientificName))


