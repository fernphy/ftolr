
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ftolr

<!-- badges: start -->
<!-- badges: end -->

ftolr provides access to the Fern Tree of Life (FTOL) and related
datasets.

## Installation

You can install the development version of ftolr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("joelnitta/ftolr")
```

## Example

The `ft_tree()` function loads FTOL into your R session. There are
several options available to control branch lengths, presence or absence
of outgroup, and sampling scheme.

``` r
library(ftolr)
# Load the full, ultrametric tree
ft_tree("full", "ultra")
#> 
#> Phylogenetic tree with 5581 tips and 5580 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   Root, 100/100, 100/100, 100/100, 100/100, 100/100, ...
#> 
#> Rooted; includes branch lengths.
```
