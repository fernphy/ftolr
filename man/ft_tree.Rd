% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ft_tree.R
\name{ft_tree}
\alias{ft_tree}
\title{Load the Fern Tree of Life (FTOL)}
\usage{
ft_tree(
  branch_len = "ultra",
  consensus = TRUE,
  rooted = TRUE,
  backbone = FALSE,
  drop_og = FALSE,
  label_ages = FALSE,
  decimals = NULL
)
}
\arguments{
\item{branch_len}{Character vector of length 1; how to treat branch lengths.
Must choose from \code{"ultra"} (ultrametric tree, branchlengths in units of
time), \code{"raw"} (raw branchlengths in units of genetic change), or \code{"clado"}
(cladogram, no branchlengths).  Default \code{"ultra"}.}

\item{consensus}{Logical vector of length 1; if \code{TRUE}, the majority-rule
extended consensus phylogeny will be returned; otherwise returns the
maximum-likelihood tree. Default \code{TRUE}.}

\item{rooted}{Logical vector of length 1; if \code{TRUE}, the phylogeny will be
rooted on bryophytes; otherwise the phylogeny is unrooted. Default \code{TRUE}.}

\item{backbone}{Logical vector of length 1; if \code{TRUE}, the backbone phylogeny
(only species with complete plastomes available) will be returned;
otherwise the phylogeny will include all species. Default \code{FALSE}.}

\item{drop_og}{Logical vector of length 1; if \code{TRUE}, the outgroup
(non-ferns) will be excluded; otherwise the outgroup is included. Default
\code{FALSE}.}

\item{label_ages}{Logical vector of length 1; if \code{TRUE}, internal nodes will
be labeled with ages. Only works if \code{branch_len} is \verb{"ultra".}
Default \code{FALSE}.}

\item{decimals}{Numeric vector of length 1; number of decimals for rounding
node labels if \code{label_ages} is \code{TRUE}; \code{null} (default) does no rounding.}
}
\value{
List of class "phylo"; a phylogenetic tree.
}
\description{
For details on methods used to infer the tree, see Nitta et al. 2022.
}
\details{
Not all combinations are possible. For example, \code{branch_len = "ultra"} is
only available if \code{backbone = FALSE}.
}
\examples{
# Default is the consensus tree with branchlengths in units of time
ft_tree()
}
\references{
Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
open and continuously updated fern tree of life. https://doi.org/10.3389/fpls.2022.909768
}
