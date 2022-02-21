## code to prepare `phylogeny` dataset goes here

backbone_tree <- ape::read.tree(here::here("data-raw/plastome_tree.tre"))

usethis::use_data(backbone_tree, overwrite = TRUE)
