source("data.R")
library(dplyr)

motor_vehicle_scc <- SCC %>% 
    mutate(lower_str = tolower(SCC.Level.Three)) %>% 
    filter(grepl("vehicle", lower_str)) %>% 
    distinct(SCC)

baltimoreMotorVehicleSumByYear <- 
    inner_join(NEI, motor_vehicle_scc, by = c("SCC")) %>%
    filter(fips=="24510") %>%
    group_by(year) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    ungroup()

plot(baltimoreMotorVehicleSumByYear, type = "l", main = "Baltimor motor vehicle sources")

dev.copy(png, filename = "plot5.png", width = 480, height = 480, bg = "white")
dev.off()