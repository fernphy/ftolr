## code to prepare taxonomy datasets goes here

# To import/update all data, run import_data.R

ftol_taxonomy <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_sampling.csv") |>
  readr::read_csv() |>
  dplyr::select(
    species, genus, subfamily, family, suborder, order, major_clade,
    outgroup)

ftol_ferns <- ftol_taxonomy |>
  dplyr::filter(outgroup == FALSE) |>
  dplyr::pull(species) |>
  sort()

if (length(ftol_ferns) != dplyr::n_distinct(ftol_ferns)) {
  stop("Not all fern species distinct")
}

usethis::use_data(ftol_taxonomy, overwrite = TRUE)
usethis::use_data(ftol_ferns, overwrite = TRUE)

# Clean up any remaining connections from archive
closeAllConnections()
