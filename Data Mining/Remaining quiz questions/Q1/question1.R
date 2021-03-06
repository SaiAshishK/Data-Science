
setwd("E:/Spec/Data-Science/Data Mining/Remaining quiz questions/Q1")
index_data<-read.csv("BSE_Sensex_Index.csv", header = TRUE)


str(index_data)

library(dplyr)

#open, High, low, close, volume, adj close diff column
new_data = mutate(index_data, open_diff = lead((lag(Open) - Open) / Open), high_diff = lead((lag(High) - High) / High), low_diff = lead((lag(Low) - Low) / Low), close_diff = lead((lag(Close) - Close) / Close), vol_diff = lead((lag(Volume) - Volume) / Volume), adj_diff = lead((lag(Adj_Close) - Adj_Close) / Adj_Close))

new_data

#adding last row value to open_diff 
lastcol = nrow(new_data)
a = new_data$open_diff[lastcol-1]
b = new_data$open_diff[lastcol-2]
c = new_data$open_diff[lastcol-3]
new_data$open_diff[lastcol] = mean(a,b,c)

#adding last row value to open_diff 
lastcol = nrow(new_data)
a = new_data$high_diff[lastcol-1]
b = new_data$high_diff[lastcol-2]
c = new_data$high_diff[lastcol-3]
new_data$high_diff[lastcol] = mean(a,b,c)

#adding last row value to low_diff 
lastcol = nrow(new_data)
a = new_data$low_diff[lastcol-1]
b = new_data$low_diff[lastcol-2]
c = new_data$low_diff[lastcol-3]
new_data$low_diff[lastcol] = mean(a,b,c)


#adding last row value to close_diff 
lastcol = nrow(new_data)
a = new_data$close_diff[lastcol-1]
b = new_data$close_diff[lastcol-2]
c = new_data$close_diff[lastcol-3]
new_data$close_diff[lastcol] = mean(a,b,c)

#adding last row value to close_diff 
lastcol = nrow(new_data)
a = new_data$vol_diff[lastcol-1]
b = new_data$vol_diff[lastcol-2]
c = new_data$vol_diff[lastcol-3]
new_data$vol_diff[lastcol] = mean(a,b,c)

#adding last row value to adj_diff 
lastcol = nrow(new_data)
a = new_data$adj_diff[lastcol-1]
b = new_data$adj_diff[lastcol-2]
c = new_data$adj_diff[lastcol-3]
new_data$adj_diff[lastcol] = mean(a,b,c)

new_data

#A random sample of 1000 observations is extracted from the data

sample1000 = new_data[sample(nrow(new_data), 1000), ]
str(sample1000)

sample3000 = new_data[sample(nrow(new_data), 3000), ]
str(sample3000)


#Mean, Max, Variance and Quantile for samples of open_diff
mean(sample1000$open_diff)
mean(sample3000$open_diff)
max(sample1000$open_diff)
max(sample3000$open_diff)
var(sample1000$open_diff)
var(sample3000$open_diff)
quantile(sample1000$open_diff,.25)
quantile(sample3000$open_diff,.25)



#Mean, Max, Variance and Quantile for samples of high_diff
mean(sample1000$high_diff)
mean(sample3000$high_diff)
max(sample1000$high_diff)
max(sample3000$high_diff)
var(sample1000$high_diff)
var(sample3000$high_diff)
quantile(sample1000$high_diff,.25)
quantile(sample3000$high_diff,.25)

#Mean, Max, Variance and Quantile for samples of low_diff

mean(sample1000$low_diff)
mean(sample3000$low_diff)
max(sample1000$low_diff)
max(sample3000$low_diff)
var(sample1000$low_diff)
var(sample3000$low_diff)
quantile(sample1000$low_diff,.25)
quantile(sample3000$low_diff,.25)

#Mean, Max, Variance and Quantile for samples of close_diff

mean(sample1000$close_diff)
mean(sample3000$close_diff)
max(sample1000$close_diff)
max(sample3000$close_diff)
var(sample1000$close_diff)
var(sample3000$close_diff)
quantile(sample1000$close_diff,.25)
quantile(sample3000$close_diff,.25)

#Mean, Max, Variance and Quantile for samples of vol_diff

mean(sample1000$vol_diff)
mean(sample3000$vol_diff)
max(sample1000$vol_diff)
max(sample3000$vol_diff)
var(sample1000$vol_diff)
var(sample3000$vol_diff)
quantile(sample1000$vol_diff,.25)
quantile(sample3000$vol_diff,.25)

#Mean, Max, Variance and Quantile for samples of adj_diff

mean(sample1000$adj_diff)
mean(sample3000$adj_diff)
max(sample1000$adj_diff)
max(sample3000$adj_diff)
var(sample1000$adj_diff)
var(sample3000$adj_diff)
quantile(sample1000$adj_diff,.25)
quantile(sample3000$adj_diff,.25)

# Mean, Max, Variance and Quantile for complete data set for open
mean(new_data$Open)
max(new_data$Open)
var(new_data$Open)
quantile(new_data$Open,.25)

# Mean, Max, Variance and Quantile for complete data set for high
mean(new_data$High)
max(new_data$High)
var(new_data$High)
quantile(new_data$High,.25)

# Mean, Max, Variance and Quantile for complete data set for low
mean(new_data$Low)
max(new_data$Low)
var(new_data$Low)
quantile(new_data$Low,.25)

# Mean, Max, Variance and Quantile for complete data set for close
mean(new_data$Close)
max(new_data$Close)
var(new_data$Close)
quantile(new_data$Close,.25)

# Mean, Max, Variance and Quantile for complete data set for volume
mean(new_data$Volume)
max(new_data$Volume)
var(new_data$Volume)
quantile(new_data$Volume,.25)

# Mean, Max, Variance and Quantile for complete data set for adj_close
mean(new_data$Adj_Close)
max(new_data$Adj_Close)
var(new_data$Adj_Close)
quantile(new_data$Adj_Close,.25)

#Box plot
boxplot(new_data$Open,new_data$High, new_data$Low, new_data$Close, new_data$Volume, new_data$Adj_Close, col = 'blue', main = 'BSE_Sensex_Index plot', names=c("Open","High","Low","Close","Volume","Adj_close"),ylab = "Range of  values")

# Frequency Histogram for close variable

hist(new_data$Close,breaks=seq(0,2000,by=200),col='blue',xlab = "Close",ylab = "Frequency",main = "BSE_Sensex_Index Close column")



