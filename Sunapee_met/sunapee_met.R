library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggpubr)
library(LakeMetabolizer)


setwd("~/Dropbox/JHW_thesis/Sunapee_met")

airtemp <- read.csv("2007-2020_airtemp_L1.csv")
wind <- read.csv("2007-2020_wind_L1.csv")
par <- read.csv("2007-2020_PAR_L1.csv")


unique(airtemp$location)

airtemp <- airtemp %>% 
  filter(location == "loon" | location == "harbor")

wind <- wind %>% 
  filter(location == "loon" | location == "harbor")

par <- par %>% 
  filter(location == "loon" | location == "harbor")



day(airtemp$datetime)
library(dplyr)
library(lubridate)

airtemp$datetime <- as.POSIXct(airtemp$datetime)

colnames(airtemp)

?round_date

airtemp_mean <- airtemp %>%
  mutate(date = round_date(datetime, "day")) %>%
  group_by(date) %>%
  summarize(mean_temp = mean(AirTemp_degC))

colnames(airtemp_mean) <- c("datetime", "mean_temp", "location")
airtemp_mean$datetime <- as.Date(airtemp_mean$datetime)
write.csv(airtemp_mean, "airtemp_mean_filtered.csv", row.names = FALSE)

###########################################################

wind$datetime <- as.POSIXct(wind$datetime)
colnames(wind)

wind_mean <- wind %>%
  mutate(date = round_date(datetime, "day")) %>%
  group_by(date) %>%
  summarize(mean_temp = mean(WindSp_ms))


colnames(wind_mean) <- c("datetime", "WindSp_ms")
wind_mean$datetime <- as.Date(wind_mean$datetime)
write.csv(wind_mean, "wind_mean_filtered.csv", row.names = FALSE)


###########################################################

par$datetime <- as.POSIXct(par$datetime)
colnames(par)

par_mean <- par %>%
  mutate(date = round_date(datetime, "day")) %>%
  group_by(date) %>%
  summarize(mean_temp = mean(PAR_umolm2s))


colnames(par_mean) <- c("datetime", "PAR_umolm2s")
par_mean$datetime <- as.Date(par_mean$datetime)
parmean <- par.to.sw(par_mean, par.col = "PAR_umolm2s")


write.csv(par_mean, "par_mean_filtered.csv", row.names = FALSE)



