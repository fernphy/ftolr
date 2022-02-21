#' Fern Tree of Life (FTOL) backbone phylogeny
#'
#' A phylogenetic tree inferred from whole fern plastomes, including maximal
#' sampling of available species on GenBank.
#'
#' Includes `r ape::Ntip(backbone_tree)` tips and `r ape::Nnode(backbone_tree)`
#' internal nodes. Branch lengths are in units of estimated genetic change
#' (not ultrametric). Node labels are bootstrap support (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W.
#' (2022) An open and continuously updated Fern Tree of Life (FTOL).
#' FIXME ADD DOI
"backbone_tree"

#' Fern Tree of Life (FTOL) taxonomic data
#'
#' Taxonomic data for species included in FTOL. For compact printing, it is
#' recommended to use the `tibble` library (`library(tibble)`).
#'
#' Taxonomy follows Pteridophyte Phylogeny Group I (2016).
#'
#' @format A tibble (data frame) with `r nrow(ftol_taxonomy)` rows and
#' `r ncol(ftol_taxonomy)` columns.
#' \describe{
#'   \item{species}{Species name}
#'   \item{genus}{Genus name}
#'   \item{subfamily}{Subfamily name}
#'   \item{family}{Family name}
#'   \item{suborder}{Suborder name}
#'   \item{order}{Order name}
#'   \item{major_clade}{Informal higher level clade name, either order or suborder}
#'   \item{outgroup}{Logical; TRUE for outgroup taxa, FALSE for ingroup taxa (ferns)}
#' }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W.
#' (2022) An open and continuously updated Fern Tree of Life (FTOL).
#' FIXME ADD DOI
#' @references Pteridophyte Phylogeny Group I (2016) A community-derived
#'   classification for extant lycophytes and ferns. Journal of Systematics
#'   and Evolution 54:563–603. \url{https://doi.org/10.1111/jse.12229}
#'
"ftol_taxonomy"

#' Fern Tree of Life (FTOL) fern species
#'
#' Fern species names included in FTOL in alphabetical order. All species names
#' are unique. Includes `r length(ftol_ferns)` species.
#'
#' @format Character vector
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W.
#' (2022) An open and continuously updated Fern Tree of Life (FTOL).
#' FIXME ADD DOI
"ftol_ferns"
