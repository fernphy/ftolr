#' Subset a DNA alignment by locus name
#'
#' Internal function
#'
#' @param seqs Matrix of class "DNAbin"
#' @param loci Names of loci to subset
#' @param parts Tibble (dataframe) with three columns: locus, start, end
#'
#' @return Matrix of class "DNAbin" subset to the specified loci
#' @noRd
subset_alignment <- function(seqs, loci, parts) {

  # Subset the parts tibble to the selected loci
  parts_use <- parts[parts$locus %in% loci, ]

  # Loop through the selected loci and subset an alignment for each
  seq_parts <- NULL
  for (i in 1:nrow(parts_use)) {
    seq_parts[[i]] <- seqs[,parts_use$start[[i]]:parts_use$end[[i]] ]
  }

  # Concatenate the subset alignments
  do.call(ape::cbind.DNAbin, seq_parts)

}

#' Load the DNA sequences used to build the Fern Tree of Life (FTOL)
#'
#' For details about the data, see [plastome_alignment] for plastome sequences
#' and [sanger_alignment] for Sanger sequences.
#'
#' After subsetting loci, columns / rows consisting of only gaps
#' will be deleted regardless of `del_gaps` argument (`del_gaps` deletes *all*
#' gaps, typically resulting in unaligned sequences).
#'
#' For details on methods used to assemble alignments, see Nitta et al. 2022.
#'
#' @param loci Character vector (optional); names of loci to include in the
#' output. If `NULL` (default), all loci will be included. For a list of valid
#' locus names, see [plastome_parts] for plastome loci and [sanger_parts] for
#' Sanger loci.
#' @param plastome Logical vector of length 1; If `TRUE`, the alignment will
#' include loci and species with complete plastomes available; otherwise
#' will include Sanger loci and all species. Default `FALSE`.
#' @param aligned Logical vector of length 1; If `TRUE`, the output will be
#' aligned sequences (matrix); otherwise will be unaligned (list).
#' Default `TRUE`.
#' @param del_gaps Logical vector of length 1; If `TRUE`, all gaps
#' will be deleted from the alignment. Default is `TRUE` if `loci` is `NULL`,
#' `FALSE` otherwise.
#' @param drop_og Logical vector of length 1; If `TRUE`, the outgroup
#'   (non-ferns) will be excluded; otherwise the outgroup is included. Default
#'   `FALSE`.
#'
#' @return List or matrix of class "DNAbin"; DNA sequences.
#' @export
#'
#' @examples
#' # Default is aligned Sanger sequences
#' ft_seqs()
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated fern tree of life. https://doi.org/10.3389/fpls.2022.909768
#'
ft_seqs <- function(
  loci = NULL,
  plastome = FALSE,
  aligned = TRUE,
  del_gaps = ifelse(is.null(loci), FALSE, TRUE),
  drop_og = FALSE
) {

  # Alignment type
  if (plastome == TRUE) {
    seqs <- plastome_alignment
    parts <- plastome_parts
  } else {
    seqs <- sanger_alignment
    parts <- sanger_parts
  }

  # Subsetting
  if (!is.null(loci)) {
    # Check input
    assertthat::assert_that(is.character(loci))
    bad_loci <- setdiff(loci, parts$locus)
    bad_loci_text <- paste(bad_loci, collapse = ", ")
    bad_loci_text <- paste(
      "'loci' include the following invalid values:",
      bad_loci_text
    )
    assertthat::assert_that(
      length(bad_loci) == 0,
      msg = bad_loci_text
    )
    # Subset the alignment by loci
    seqs <- subset_alignment(seqs, loci, parts)
  }

  # Drop OG
  if (isTRUE(drop_og)) {
    seqs <- seqs[intersect(ftol_ferns, row.names(seqs)), ]
  }

  # Delete any columns/rows with all gaps
  seqs <- ape::del.colgapsonly(seqs)
  seqs <- ape::del.rowgapsonly(seqs)

  # If desired, delete *all* gaps
  assertthat::assert_that(
    !(del_gaps == TRUE && aligned == TRUE),
    msg = "Cannot both delete gaps (del_gaps TRUE) and require the sequences to be aligned (aligned TRUE)" # nolint
  )
  if (del_gaps == TRUE) {
    seqs <- ape::del.gaps(seqs)
  }

  # Convert to list if requested
  if (aligned == FALSE) seqs <- as.list(seqs)

  return(seqs)

}
