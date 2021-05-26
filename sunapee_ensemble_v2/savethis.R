library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(reshape2)



setwd("~/Dropbox/ManualDownloadsSCCData/BVR_SensorString/DO/cr")

do <- read_csv("dissolved_ox.csv")

str(do)

do$Date <- as.Date.character(do$DateTime_EST)
str(do)
do$Date <- as.integer(gsub(pattern = "-", replacement="", x = do$Date))
str(do)


hobo_df$Flag_TempC[hobo_df$Date == 20190627 & hobo_df$Temp_C > 30 | hobo_df$Date == 20190516 & hobo_df$Temp_C > 30 |
                     hobo_df$Date == 20190620 & hobo_df$Temp_C > 30] <- 1



do$Depth_m[do$DateTime_EST >= "2018-12-06"  & do$DateTime_EST <= "2019-05-16"] <- 10

do$Depth_m[do$DateTime_EST >= "2019-12-06 15:35:00"  & do$DateTime_EST <= "2020-05-14 11:44:00"] <- 10


do$Depth_m[do$DateTime_EST >= "2019-06-27 14:00:00"  & do$DateTime_EST <= "2019-12-06 15:11:00"] <- 5.5

do$Depth_m[do$DateTime_EST >= "2020-05-14 11:54:00"] <- 5.5

do$Depth_m[do$Depth_m == 5] <-  5.5


ggplot(data = do, mapping = aes(x = DateTime_EST, y = doobs_mgL, col = as.factor(Depth_m))) + geom_point()



write_csv(do, "newdepths_do.csv")







