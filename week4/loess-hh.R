mydata <-read.csv("http://enigma.blacklabelsoft.com/public/InternetTraffic.csv", sep=",")
attach(mydata)

#Plots the data
plot(Year, IP_Traffic)

# Apply loess smoothing using the default span value of 0.8.  You can change the curve by changing the span value.
y.loess <- loess(y ~ x, span=0.8, data.frame(x=Year, y=IP_Traffic))

# Compute loess smoothed values for all points along the curve
y.predict <- predict(y.loess, data.frame(x=Year))

# Plots the curve.
lines(Year,y.predict)

legend("topleft", c("PB/Month"), col = c(1), cex = 0.75,
       text.col = "black", lty = c(1 ,-1, -1), pch = c(-1, 19, 17),
       merge = TRUE, bg = 'gray90')

#Add title
title(main="Global Internet Traffic")