## code to prepare parts datasets goes here

# To import/update all data, run import_data.R

# Read in "parts" files
plastome_parts <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_plastome_parts.csv") |>
  readr::read_csv()

sanger_parts <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_parts.csv") |>
  readr::read_csv()

use_data(plastome_parts, overwrite = TRUE)
use_data(sanger_parts, overwrite = TRUE)

# Clean up any remaining connections from archive
closeAllConnections()
