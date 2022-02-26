## code to prepare phylogeny datasets goes here

backbone_tree <- ape::read.tree(here::here("data-raw/ftol_plastome_con.tre"))
ftol_con_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_con.tre"))
ftol_con_dated_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_con_dated.tre"))
ftol_ml_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_ml.tre"))
ftol_ml_dated_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_ml_dated.tre"))

usethis::use_data(backbone_tree, overwrite = TRUE)
usethis::use_data(ftol_con_tree, overwrite = TRUE)
usethis::use_data(ftol_con_dated_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_dated_tree, overwrite = TRUE)
