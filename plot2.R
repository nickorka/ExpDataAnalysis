source("data.R")
library(dplyr)

baltimorSumByYear <- 
    NEI %>% 
    filter(fips=="24510") %>%
    group_by(year) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    ungroup()

plot(baltimorSumByYear, type = "l", main = "Total emissions in Baltimore City")

dev.copy(png, filename = "plot2.png", width = 480, height = 480, bg = "white")
dev.off()