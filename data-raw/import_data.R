# Copy most recent results files into data-raw

library(fs)
library(magrittr)

# Specify location of FTOL targets cache
ftol_cache_path <- "~/repos/ftol/_targets"

ftol_results_files <- list.files(
  path(ftol_cache_path, "user/results/ftolr"),
  full.names = TRUE
)

dest_files <- path_file(ftol_results_files) %>%
  path("data-raw", .)

# Copy results files from targets cache
fs::file_copy(
  ftol_results_files,
  dest_files,
  overwrite = TRUE
)

# Update all data files
source("data-raw/accessions.R")
source("data-raw/alignment.R")
source("data-raw/ftol_taxonomy.R")
source("data-raw/phylogeny.R")
