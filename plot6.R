source("data.R")
library(dplyr)

motor_vehicle_scc <- SCC %>% 
    mutate(lower_str = tolower(SCC.Level.Three)) %>% 
    filter(grepl("vehicle", lower_str)) %>% 
    distinct(SCC)

statesMotorVehicleSumByYear <- 
    inner_join(NEI, motor_vehicle_scc, by = c("SCC")) %>%
    filter(fips %in% c("24510", "06037")) %>%
    group_by(year, fips) %>% 
    summarise(year_total = sum(Emissions, na.rm = T)) %>% 
    mutate(city = case_when(fips == "24510" ~ "Baltimore", fips == "06037" ~ "LA")) %>%
    ungroup()

g <- ggplot(statesMotorVehicleSumByYear, aes(year, year_total, group=city)) 
g + geom_line(aes(color=city)) + labs(title = "Annual PM2.5 by cities")

dev.copy(png, filename = "plot6.png", width = 480, height = 480, bg = "white")
dev.off()