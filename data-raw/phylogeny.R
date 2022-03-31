## code to prepare phylogeny datasets goes here

# To import/update all data, run import_data.R

backbone_tree <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_plastome_con.tre") |>
  ape::read.tree()

ftol_con_tree <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_con.tre") |>
  ape::read.tree()

ftol_con_dated_tree <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_con_dated.tre") |>
  ape::read.tree()

ftol_ml_tree <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_ml.tre") |>
  ape::read.tree()

ftol_ml_dated_tree <-
  archive::archive_read(
    here::here("data-raw/ftol.zip"),
    file = "ftol_sanger_ml_dated.tre") |>
  ape::read.tree()

usethis::use_data(backbone_tree, overwrite = TRUE)
usethis::use_data(ftol_con_tree, overwrite = TRUE)
usethis::use_data(ftol_con_dated_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_dated_tree, overwrite = TRUE)

# Clean up any remaining connections from archive
closeAllConnections()
