# R script for releasing new versions of ftolr
# requires [github cli](https://cli.github.com/) to be installed
# automatically updates CFF file

library(gert)
library(desc)

# Make sure README is up-to-date
devtools::build_readme()

# Specify version and release notes
# - by default use version produced by ft_data_ver()
source(here::here("R/ft_data_ver.R"))
new_ver <- glue::glue("v{ft_data_ver()}")

notes <- paste(
  glue::glue(
    "Built with DNA sequences in GenBank release {ft_data_ver(what='gb')}"),
  glue::glue("(cutoff date {ft_data_ver(what='cutoff')})")
)

# Update version in DESCRIPTION
desc <- description$new()
desc$set("Version", ft_data_ver())
desc$write(file = "DESCRIPTION")
git_add("DESCRIPTION")
git_commit("Update DESCRIPTION")

# Update version in CFF
cff <- glue::glue('
cff-version: 1.1.0
authors:
- name: "FTOL working group"
title: "ftolr: Data for the Fern Tree of Life (FTOL)"
type: software
version: {new_ver}
date-released: {Sys.Date()}')
readr::write_lines(cff, "CITATION.cff")
git_add("CITATION.cff")
git_commit("Update CITATION.cff")

if (nrow(git_status()) > 0) stop("Must have clean git repo before releasing")

# Push release
git_push()
system(glue::glue(
  'gh release create {new_ver} --notes "{notes}"'
))
