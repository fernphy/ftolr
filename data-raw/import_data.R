devtools::load_all()

# Download data ----

# Get current ftol data version
ftol_data_version <- ft_data_ver()

# Download zipped FTOL data
download.file(
  glue::glue("https://github.com/fernphy/ftol_data/archive/refs/tags/v{ftol_data_version}.zip"), # nolint
  here::here("data-raw/ftol.zip")
)

# Unzip data
utils::unzip(
  here::here("data-raw/ftol.zip"),
  exdir = "data-raw"
)

ftol_data_dir <- glue::glue("data-raw/ftol_data-{ftol_data_version}")

# Accessions ----
accessions_long <-
  fs::path(ftol_data_dir, "ftol_acc_table_long.csv") |>
  readr::read_csv()

accessions_wide <-
  fs::path(ftol_data_dir, "ftol_acc_table_wide.csv") |>
  readr::read_csv()

usethis::use_data(accessions_long, overwrite = TRUE)
usethis::use_data(accessions_wide, overwrite = TRUE)

# Alignments ----
plastome_alignment <-
  fs::path(ftol_data_dir, "ftol_plastome_alignment.fasta.gz") |>
  ape::read.FASTA() |>
  as.matrix()

sanger_alignment <-
  fs::path(ftol_data_dir, "ftol_sanger_alignment.fasta.gz") |>
  ape::read.FASTA() |>
  as.matrix()

usethis::use_data(plastome_alignment, overwrite = TRUE)
usethis::use_data(sanger_alignment, overwrite = TRUE)

# Fossils ----
ml_fossils <-
  fs::path(ftol_data_dir, "ftol_sanger_ml_fossils.csv") |>
  readr::read_csv()

con_fossils <-
  fs::path(ftol_data_dir, "ftol_sanger_con_fossils.csv") |>
  readr::read_csv()

usethis::use_data(ml_fossils, overwrite = TRUE)
usethis::use_data(con_fossils, overwrite = TRUE)

# Taxonomy ----
ftol_taxonomy <-
  fs::path(ftol_data_dir, "ftol_sanger_sampling.csv") |>
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

ftol_match_results <-
  fs::path(ftol_data_dir, "ftol_match_results.csv") |>
  readr::read_csv(col_types = readr::cols(.default = readr::col_character()))

usethis::use_data(ftol_match_results, overwrite = TRUE)

# Partitions -----
plastome_parts <-
  fs::path(ftol_data_dir, "ftol_plastome_parts.csv") |>
  readr::read_csv()

sanger_parts <-
  fs::path(ftol_data_dir, "ftol_sanger_parts.csv") |>
  readr::read_csv()

use_data(plastome_parts, overwrite = TRUE)
use_data(sanger_parts, overwrite = TRUE)

# Phylogeny ----
backbone_tree <-
  fs::path(ftol_data_dir, "ftol_plastome_con.tre") |>
  ape::read.tree()

ftol_con_tree <-
  fs::path(ftol_data_dir, "ftol_sanger_con.tre") |>
  ape::read.tree()

ftol_con_dated_tree <-
  fs::path(ftol_data_dir, "ftol_sanger_con_dated.tre") |>
  ape::read.tree()

ftol_ml_tree <-
  fs::path(ftol_data_dir, "ftol_sanger_ml.tre") |>
  ape::read.tree()

ftol_ml_dated_tree <-
  fs::path(ftol_data_dir, "ftol_sanger_ml_dated.tre") |>
  ape::read.tree()

usethis::use_data(backbone_tree, overwrite = TRUE)
usethis::use_data(ftol_con_tree, overwrite = TRUE)
usethis::use_data(ftol_con_dated_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_tree, overwrite = TRUE)
usethis::use_data(ftol_ml_dated_tree, overwrite = TRUE)

# Clean up ----
fs::dir_delete(glue::glue("data-raw/ftol_data-{ftol_data_version}"))
fs::file_delete("data-raw/ftol.zip")
