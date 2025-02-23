## code to prepare `organism_map` dataset goes here

organism_map <- read_mapping(
  "inst/extdata/CodeDict_Organism_mylab.txt",
  type = "organism"
)

usethis::use_data(organism_map, overwrite = TRUE)
