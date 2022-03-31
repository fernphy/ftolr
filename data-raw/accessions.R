## code to prepare accessions datasets goes here

# To import/update all data, run import_data.R

accessions_long <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_acc_table_long.csv") |>
  readr::read_csv()

accessions_wide <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_acc_table_wide.csv") |>
  readr::read_csv()

usethis::use_data(accessions_long, overwrite = TRUE)
usethis::use_data(accessions_wide, overwrite = TRUE)

# Clean up any remaining connections from archive
closeAllConnections()
