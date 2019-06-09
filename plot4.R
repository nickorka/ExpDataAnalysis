source("data.R")
library(dplyr)

coal_scc <- SCC %>% 
    mutate(lower_str = tolower(SCC.Level.Three)) %>% 
    filter(grepl("coal", lower_str)) %>% 
    distinct(SCC)

coalSumByYearBy <- 
    inner_join(NEI, coal_scc, by = c("SCC")) %>%
    group_by(year) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    ungroup()

plot(coalSumByYearBy, type = "l", main = "Coal combustion-related sources")

dev.copy(png, filename = "plot4.png", width = 480, height = 480, bg = "white")
dev.off()