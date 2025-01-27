unzip_datafile <- function(zipfile = "RAND-LAB-dataset.zip")
  if (!file.exists("data/K3anon_FullDataset_for_VfM.csv")) {
    unzip(file.path("data", zipfile), exdir = "data")
    list.files("data/", pattern = "\\.csv")
  } else {
