source("data.R")
library(dplyr)

sumByYear <- 
    NEI %>% 
    group_by(year) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    ungroup()

plot(sumByYear, type = "l")

dev.copy(png, filename = "plot1.png", width = 480, height = 480, bg = "white")
dev.off()