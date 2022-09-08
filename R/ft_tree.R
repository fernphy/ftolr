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
#' @param consensus Logical vector of length 1; if `TRUE`, the majority-rule
#'   extended consensus phylogeny will be returned; otherwise returns the
#'   maximum-likelihood tree. Default `TRUE`.
#' @param rooted Logical vector of length 1; if `TRUE`, the phylogeny will be
#'   rooted on bryophytes; otherwise the phylogeny is unrooted. Default `TRUE`.
#' @param backbone Logical vector of length 1; if `TRUE`, the backbone phylogeny
#'   (only species with complete plastomes available) will be returned;
#'   otherwise the phylogeny will include all species. Default `FALSE`.
#' @param drop_og Logical vector of length 1; if `TRUE`, the outgroup
#'   (non-ferns) will be excluded; otherwise the outgroup is included. Default
#'   `FALSE`.
#' @param label_ages Logical vector of length 1; if `TRUE`, internal nodes will
#'   be labeled with ages. Only works if `branch_len` is `"ultra".`
#'   Default `FALSE`.
#' @param decimals Numeric vector of length 1; number of decimals for rounding
#'   node labels if `label_ages` is `TRUE`; `null` (default) does no rounding.
#'
#' @return List of class "phylo"; a phylogenetic tree.
#' @export
#'
#' @examples
#' # Default is the consensus tree with branchlengths in units of time
#' ft_tree()
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
ft_tree <- function(
  branch_len = "ultra",
  consensus = TRUE,
  rooted = TRUE,
  backbone = FALSE,
  drop_og = FALSE,
  label_ages = FALSE,
  decimals = NULL
) {
  # Check arguments
  assertthat::assert_that(assertthat::is.string(branch_len))
  assertthat::assert_that(
    branch_len %in% c("ultra", "raw", "clado"),
    msg = "'branch_len' must be one of 'ultra', 'raw', or 'clado'")
  assertthat::assert_that(assertthat::is.flag(backbone))
  assertthat::assert_that(assertthat::is.flag(drop_og))
  assertthat::assert_that(assertthat::is.flag(rooted))
  assertthat::assert_that(assertthat::is.flag(consensus))
  assertthat::assert_that(assertthat::is.flag(label_ages))

  # Check arg combinations
  assertthat::assert_that(
    !(backbone == TRUE && branch_len == "ultra"),
    msg = "Backbone tree not available with ultrametric (dated) branchlengths"
  )
  assertthat::assert_that(
    !(backbone == TRUE && consensus == FALSE),
    msg = "Backbone tree only available as consensus tree'"
  )
  if (isTRUE(label_ages)) {
    assertthat::assert_that(
      branch_len == "ultra",
      msg = "Age labeling at nodes only allowed with ultrametric (dated) branchlengths" # nolint
  )
  }
  if (!is.null(decimals)) {
    assertthat::assert_that(assertthat::is.number(decimals))
  }

  # Choose starting tree
  phy <- backbone_tree
  if (backbone == TRUE) {
    phy <- backbone_tree
  } else if (backbone == FALSE && branch_len == "raw") {
    if (consensus == TRUE) {
      phy <- ftol_con_tree
    } else {
      phy <- ftol_ml_tree
    }
  } else if (backbone == FALSE && branch_len == "ultra") {
    if (consensus == TRUE) {
      phy <- ftol_con_dated_tree
    } else {
      phy <- ftol_ml_dated_tree
    }
  }

  # Make adjustments
  if (label_ages == TRUE) phy <- label_with_ages(phy, decimals = decimals)
  if (branch_len == "clado") phy$edge.length <- NULL
  if (drop_og == TRUE) phy <- ape::keep.tip(
      phy,
      intersect(phy$tip.label, ftol_ferns)
    )
  if (rooted == FALSE) phy <- ape::unroot(phy)

  return(phy)
}
