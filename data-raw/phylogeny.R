## code to prepare phylogeny datasets goes here

backbone_tree <- ape::read.tree(here::here("data-raw/ftol_plastome_rooted.tre"))
ftol_ml_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_rooted.tre"))
ftol_time_tree <- ape::read.tree(here::here("data-raw/ftol_sanger_dated.tre"))

usethis::use_data(backbone_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_tree, overwrite = TRUE)
usethis::use_data(ftol_time_tree, overwrite = TRUE)
