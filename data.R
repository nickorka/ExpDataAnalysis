# download the file
source_files = c("data/summarySCC_PM25.rds", "data/Source_Classification_Code.rds")
if(sum(file.exists(source_files)) < 2)  {
    if(!file.exists("data")) {
        dir.create("data")
    }
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
                  "data/archive.zip", method = "curl")
    
    unzip("data/archive.zip", exdir = "data")
}

# prepare data frame
if(!exists("NEI")) {
    NEI <- readRDS(source_files[1])
}
if(!exists("SCC")) {
    SCC <- readRDS(source_files[2])
}