
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

The `ft_tree()` function loads FTOL into the current R session. There
are several options available to control branch lengths, presence or
absence of outgroup, and sampling scheme.

``` r
library(ftolr)
# Default: maximum-likelihood (ML) tree with branchlengths in units of time
ft_tree()
#> 
#> Phylogenetic tree with 5581 tips and 5580 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   Root, 100/100, 100/100, 100/100, 100/100, 100/100, ...
#> 
#> Rooted; includes branch lengths.

# ML tree with raw branchlengths and outgroup pruned
ft_tree(
  branch_len = "raw",
  drop_og = TRUE
) 
#> 
#> Phylogenetic tree with 5563 tips and 5562 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   100/100, 100/100, 100/100, 100/100, 100/100, 100/100, ...
#> 
#> Rooted; includes branch lengths.
```
