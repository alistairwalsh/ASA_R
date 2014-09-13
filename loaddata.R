library("ggplot2")
summary(ChickWeight)
ChickWeight
ggplot(ChickWeight, aes(x=time,y=weight), geom(scatter.smooth))

ChickWeight$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) 

p <- qplot(Time, weight,  data=ChickWeight, main="Scatterplots weight vs.time"
           , col=Diet
           ,xlab="Time", ylab="Weight")


# White background and black grid lines
p + theme_bw()

p

# Large brown bold italics labels
# and legend placed at top of plot
p + theme(axis.title=element_text(face="bold.italic",
                                  size="12", color="brown"), legend.position="top") 