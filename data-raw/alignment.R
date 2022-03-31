## code to prepare alignment datasets goes here

# To import/update all data, run import_data.R

# Extract fasta.gz files to temp dir
temp_fgz <- tempdir()

archive::archive_extract(
  here::here("data-raw/ftol.zip"),
  temp_fgz,
  c("ftol_plastome_alignment.fasta.gz", "ftol_sanger_alignment.fasta.gz")
)

# Read in alignments
plastome_alignment <-
  fs::path(temp_fgz, "ftol_plastome_alignment.fasta.gz") |>
  ape::read.FASTA() |>
  as.matrix()

sanger_alignment <-
  fs::path(temp_fgz, "ftol_sanger_alignment.fasta.gz") |>
  ape::read.FASTA() |>
  as.matrix()

usethis::use_data(plastome_alignment, overwrite = TRUE)
usethis::use_data(sanger_alignment, overwrite = TRUE)

# Clean up
fs::dir_delete(temp_fgz)

# Clean up any remaining connections from archive
closeAllConnections()
