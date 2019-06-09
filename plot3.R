source("data.R")
library(dplyr)
library(ggplot2)

baltimorSumByYearByType <- 
    NEI %>% 
    filter(fips=="24510") %>%
    group_by(year, type) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    ungroup()


g <- ggplot(baltimorSumByYearByType, aes(year, year_total, group=type)) 
g + geom_line(aes(color=type)) + labs(title = "Annual Baltimore PM2.5 by type")

dev.copy(png, filename = "plot3.png", width = 480, height = 480, bg = "white")
dev.off()