#' Relabel a tree with ages at each internal node
#'
#' Should only be used with ultrametric (dated) trees
#'
#' @param tree List of class 'phylo'; the phylogenetic tree
#' @param decimals Numeric vector of length 1; the number of decimals
#'   to round the ages
#' @return Phylogenetic tree with internal nodes labeled by their ages
#' @noRd
label_with_ages <- function(tree, decimals) {
  # Get total height (age) of tree
  total_height <- max(ape::node.depth.edgelength(tree))
  # Get length for each node from root
  edge_length_all <- ape::node.depth.edgelength(tree)
  # Subset to only internal nodes
  # (the first n edge lengths are tips, the rest are internal nodes)
  edge_length_internal <- edge_length_all[-seq_len(ape::Ntip(tree))]
  # Convert branch lengths to time since root
  edge_age_internal <- total_height - edge_length_internal
  if (!is.null(decimals)) {
    edge_age_internal <- round(edge_age_internal, decimals)
  }
  # Relabel nodes with ages
  tree$node.label <- edge_age_internal
  return(tree)
}

# Print phylogenies nicely
#' @importFrom ape print.phylo
NULL

# Print DNA alignments nicely
#' @importFrom ape print.DNAbin
NULL
