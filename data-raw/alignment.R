## code to prepare alignment datasets goes here

plastome_alignment <- ape::read.FASTA(
  here::here("data-raw/ftol_plastome_alignment.fasta")) |>
  as.matrix()
sanger_alignment <- ape::read.FASTA(
  here::here("data-raw/ftol_sanger_alignment.fasta")) |>
  as.matrix()

plastome_parts <- readr::read_csv(here::here("data-raw/ftol_plastome_parts.csv"))
sanger_parts <- readr::read_csv(here::here("data-raw/ftol_sanger_parts.csv"))

usethis::use_data(plastome_alignment, overwrite = TRUE)
usethis::use_data(sanger_alignment, overwrite = TRUE)

usethis::use_data(plastome_parts, overwrite = TRUE)
usethis::use_data(sanger_parts, overwrite = TRUE)
