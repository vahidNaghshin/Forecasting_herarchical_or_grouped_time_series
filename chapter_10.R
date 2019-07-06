library(fpp2)
library(hts)
#Problem 10-1
autoplot(prison)
prison.hts <- hts(prison, bnames = colnames(prison), characters = c(3,1,9))
smatrix(prison.hts)
#Problem 10-2
autoplot(visnights)
visnights.hts <- hts(visnights, bnames = colnames(visnights), characters = c(3,5))
smatrix(visnights.hts)
fcst<-forecast(visnights.hts, method="bu", fmethod="arima", h=8)
fcsts <- aggts(fcst, levels=0:1)
autoplot(fcsts)
#Problem 10-3
autoplot(aggts(fcst, levels=0))
agg.visnights<-aggts(visnights.hts, levels=0)
fit <- auto.arima(agg.visnights)
autoplot(forecast(fit, h=8), series="ARIMA on aggregate")+autolayer(aggts(fcst, levels=0), series = "bottom-up approach")
