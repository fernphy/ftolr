## code to prepare phylogeny datasets goes here

backbone_tree <- ape::read.tree(here::here("data-raw/plastome_tree_rooted.tre"))
ftol_ml_tree <- ape::read.tree(here::here("data-raw/sanger_tree_rooted.tre"))
ftol_time_tree <- ape::read.tree(here::here("data-raw/plastid_tree_dated.tre"))

usethis::use_data(backbone_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_tree, overwrite = TRUE)
usethis::use_data(ftol_time_tree, overwrite = TRUE)
