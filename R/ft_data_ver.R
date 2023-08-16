#' Current Fern Tree of Life (FTOL) version and related metadata
#'
#' @details FTOL is built from DNA sequence data obtained from the NCBI GenBank
#' FTP server (<https://ftp.ncbi.nlm.nih.gov/genbank/>), which releases updated
#' datasets periodically. For more information about the current GenBank data
#' release, see the
#' [release notes](https://ftp.ncbi.nlm.nih.gov/genbank/gbrel.txt).
#' @param what Character vector of length 1; what type of data to return. Must
#'  choose from "ftol" (FTOL data version; default), "gb" (version of GenBank
#'  data used to build FTOL), or "cutoff" (cutoff date of GenBank data).
#' @return Character vector of length 1
#' @export
#'
#' @examples
#' ft_data_ver()
ft_data_ver <- function(what = "ftol") {
  assertthat::assert_that(
    assertthat::is.string(what),
    msg = "'what' must be a character vector of length 1")
  switch(
    what,
    ftol = "1.5.0",
    gb = "256",
    cutoff = "2023-06-15",
    "'what' must be one of 'ftol', 'gb', or 'cutoff'"
  )
}
