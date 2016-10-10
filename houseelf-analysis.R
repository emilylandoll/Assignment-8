# This analysis analyzes house elf data from Dr. Granger.
houseelf_analysis <- read.csv("./data/houseelf_earlength_dna_data_1.csv")

# Problem 6
install.packages("stringr")
library("stringr")

#6.1
gc_content <- function(sequence){
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_count <- round((Gs + Cs) / str_length(sequence) * 100, digits = 2) 
  return(gc_count)}
print(gc_content(str_to_lower(houseelf_analysis$dnaseq)))

#Problem 7
source('classify_ear_size.R')
ear_length_classify <- get_size_class(houseelf_analysis$earlength)
classify_table <- data.frame(houseelf_analysis$id, ear_length_classify, gc_content((str_to_lower(houseelf_analysis$dnaseq))))
write.csv(classify_table)
