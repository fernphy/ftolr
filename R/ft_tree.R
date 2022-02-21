#' Load the Fern Tree of Life (FTOL)
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @param sampling Character vector of length 1; sampling scheme to use when
#'   loading tree. Must choose either `"backbone"` (the backbone phylogeny,
#'   including only species with whole plastome data avaiable) or `"full"` (the
#'   full phylogeny).
#' @param bl Character vector of length 1; how to treat branch lengths. Must
#'   choose from `"ultra"` (ultrametric tree, branchlengths in units of time),
#'   `"raw"` (raw branchlengths in units of genetic change), or `"clado"`
#'   (cladogram, no branchlengths). `"ultra"` is only available if `sampling` is
#'   `"full"`.
#' @param drop_og Logical vector of length 1; If `TRUE`, the outgroup will be
#'   excluded.
#'
#' @return List of class "phylo"; a phylogenetic tree.
#' @export
#'
#' @examples
#' ft_tree("full", "ultra")
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
ft_tree <- function(
  sampling = c("backbone", "full"),
  bl = c("ultra", "raw", "clado"),
  drop_og = FALSE
) {
  assertthat::assert_that(assertthat::is.string(sampling))
  assertthat::assert_that(
    sampling %in% c("backbone", "full"),
    msg = "'sampling' must be one of 'backbone' or 'full'")
  assertthat::assert_that(assertthat::is.string(bl))
  assertthat::assert_that(
    bl %in% c("ultra", "raw", "clado"),
    msg = "'bl' must be one of 'ultra', 'raw', or 'clado'")
  assertthat::assert_that(assertthat::is.flag(drop_og))

  assertthat::assert_that(
    !(sampling == "backbone" && bl == "clado"),
    msg = "'bl' cannot be set to 'clado' when 'sampling' is set to 'full'"
  )

  if (sampling == "backbone") {
    phy <- backbone_tree
  } else if (sampling == "full" && bl == "raw") {
    phy <- ftol_ml_tree
  } else if (sampling == "full" && bl == "ultra") {
    phy <- ftol_time_tree
  }

  if (bl == "clado") phy$edge.length <- NULL

  if (drop_og == TRUE) phy <- ape::keep.tip(phy, ftol_ferns)

  phy

}
