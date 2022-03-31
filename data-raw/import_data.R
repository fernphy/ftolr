# Copy most recent results files into data-raw

library(fs)
library(here)

# Specify location of FTOL targets cache
ftol_cache_path <- "~/repos/ftol/_targets"

# Copy results files from targets cache
file_copy(
  path(ftol_cache_path, "user/results/ftol.zip"),
  here("data-raw/ftol.zip"),
  overwrite = TRUE
)

# Update all data files
source("data-raw/accessions.R")
source("data-raw/fossils.R")
source("data-raw/ftol_taxonomy.R")
source("data-raw/parts.R")
source("data-raw/phylogeny.R")
# run this last, as it has a tendency to crash R studio :/
source("data-raw/alignment.R")
