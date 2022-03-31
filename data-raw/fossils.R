## code to prepare fossil datasets goes here

# To import/update all data, run import_data.R

ml_fossils <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_ml_fossils.csv") |>
  readr::read_csv()

con_fossils <-
  archive::archive_read(
  here::here("data-raw/ftol.zip"),
  file = "ftol_sanger_con_fossils.csv") |>
  readr::read_csv()

usethis::use_data(ml_fossils, overwrite = TRUE)
usethis::use_data(con_fossils, overwrite = TRUE)

# Clean up any remaining connections from archive
closeAllConnections()
