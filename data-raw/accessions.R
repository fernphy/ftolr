## code to prepare accessions datasets goes here

accessions_long <- readr::read_csv(
  here::here("data-raw/ftol_acc_table_long.csv"))

accessions_wide <- readr::read_csv(
  here::here("data-raw/ftol_acc_table_wide.csv"))

usethis::use_data(accessions_long, overwrite = TRUE)
usethis::use_data(accessions_wide, overwrite = TRUE)
