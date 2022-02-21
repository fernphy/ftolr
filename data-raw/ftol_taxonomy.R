## code to prepare `ftol_taxonomy` dataset goes here

ftol_taxonomy <- readr::read_csv(here::here("data-raw/sanger_sampling.csv")) |>
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
