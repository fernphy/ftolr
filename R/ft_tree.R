#' Load the Fern Tree of Life (FTOL)
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' Not all combinations are possible. For example, `branch_len = "ultra"` is
#' only available if `backbone = FALSE`.
#'
#' @param branch_len Character vector of length 1; how to treat branch lengths.
#'   Must choose from `"ultra"` (ultrametric tree, branchlengths in units of
#'   time), `"raw"` (raw branchlengths in units of genetic change), or `"clado"`
#'   (cladogram, no branchlengths).  Default `"ultra"`.
#' @param backbone Logical vector of length 1; If `TRUE`, the backbone phylogeny
#'   (only species with complete plastomes available) will be returned;
#'   otherwise the phylogeny will include all species. Default `FALSE`.
#' @param consensus Logical vector of length 1; If `TRUE`, the consensus
#'   phylogeny will be returned (may include polytomies); otherwise returns the
#'   maximum-likelihood (bifurcating) tree. Default `FALSE`.
#' @param drop_og Logical vector of length 1; If `TRUE`, the outgroup will be
#'   excluded; otherwise the outgroup is included. Default `FALSE`.
#' @param rooted Logical vector of length 1; If `TRUE`, the phylogeny will be
#'   rooted on bryophytes; otherwise the phylogeny is unrooted. Default `TRUE`.
#'
#' @return List of class "phylo"; a phylogenetic tree.
#' @export
#'
#' @examples
#' # Default is the maximum-likelihood tree with branchlengths in units of time
#' ft_tree()
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
ft_tree <- function(
  branch_len = "ultra",
  backbone = FALSE,
  consensus = FALSE,
  drop_og = FALSE,
  rooted = TRUE
) {
  # Check arguments
  assertthat::assert_that(assertthat::is.string(branch_len))
  assertthat::assert_that(
    branch_len %in% c("ultra", "raw", "clado"),
    msg = "'branch_len' must be one of 'ultra', 'raw', or 'clado'")
  assertthat::assert_that(assertthat::is.flag(backbone))
  assertthat::assert_that(assertthat::is.flag(drop_og))
  assertthat::assert_that(assertthat::is.flag(rooted))

  # Check arg combinations
  assertthat::assert_that(
    !(backbone == TRUE && branch_len == "clado"),
    msg = "'branch_len' cannot be set to 'caldo' when 'backbone' is set to 'TRUE'"
  )

  # Choose starting tree
  if (backbone == TRUE) {
    phy <- backbone_tree
  } else if (backbone == FALSE && branch_len == "raw") {
    phy <- ftol_ml_tree
  } else if (backbone == FALSE && branch_len == "ultra") {
    phy <- ftol_time_tree
  }

  # Make adjustments
  if (branch_len == "clado") phy$edge.length <- NULL
  if (drop_og == TRUE) phy <- ape::keep.tip(phy, ftol_ferns)
  if (rooted == FALSE) phy <- ape::unroot(phy, ftol_ferns)

  return(phy)
}
