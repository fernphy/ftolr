
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ftolr

<!-- badges: start -->
<!-- badges: end -->

ftolr is an R package that provides access to the [Fern Tree of Life
(FTOL)](https://fernphy.github.io/) and related datasets.

These data were originally compiled using methods described in this
paper:

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. An open and
continuously updated fern tree of life (FTOL)

## Installation

You can install the development version of ftolr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("joelnitta/ftolr")
```

## Examples

### Fern Tree of Life (FTOL)

The `ft_tree()` function loads FTOL into the current R session. There
are several options available to control branch lengths, presence or
absence of outgroup, and sampling scheme.

``` r
library(ftolr)
# Default: consensus tree with branchlengths in units of time
ft_tree()
#> 
#> Phylogenetic tree with 5581 tips and 5580 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   Root, 100/100, 100/100, 100/100, 100/100, 100, ...
#> 
#> Rooted; includes branch lengths.

# Maximum-likelihood (ML) tree with raw branchlengths and outgroup pruned
ft_tree(
  branch_len = "raw",
  consensus = FALSE,
  drop_og = TRUE
) 
#> 
#> Phylogenetic tree with 5563 tips and 5562 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   100/100, 100/100, 100, 100/100, 100/100, 100/100, ...
#> 
#> Rooted; includes branch lengths.
```

### DNA sequences

The DNA sequences used to build the tree are also available. These can
be subset by locus (gene) name and can be formatted as a matrix (DNA
alignment) or a list.

``` r
# Default: aligned Sanger sequences
ft_seqs()
#> 5581 DNA sequences in binary format stored in a matrix.
#> 
#> All sequences of same length: 12118 
#> 
#> Labels:
#> Acrostichum_danaeifolium
#> Actiniopteris_dimorpha
#> Actiniopteris_semiflabellata
#> Adenophorus_tenellus
#> Adiantopsis_alata
#> Adiantopsis_aurea
#> ...
#> 
#> More than 10 million bases: not printing base composition.
#> (Total: 67.63 Mb)

# Unaligned rbcL
ft_seqs(loci = "rbcL", aligned = FALSE)
#> 4796 DNA sequences in binary format stored in a list.
#> 
#> Mean sequence length: 1247.184 
#>    Shortest sequence: 210 
#>     Longest sequence: 1402 
#> 
#> Labels:
#> Acrostichum_danaeifolium
#> Actiniopteris_dimorpha
#> Actiniopteris_semiflabellata
#> Adenophorus_tenellus
#> Adiantopsis_alata
#> Adiantopsis_aurea
#> ...
#> 
#> Base composition:
#>     a     c     g     t 
#> 0.265 0.217 0.252 0.266 
#> (Total: 5.98 Mb)
```

## Citing

If you use this package, please cite it!

Here is an example:

    FTOL working group. (2022). Data for the Fern Tree of Life (FTOL) v1.0.0.

Please also cite the paper describing how the data were generated:

    Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. An open and continuously updated fern tree of life (FTOL)

## License

-   Code: [MIT](LICENSE)
-   Data (files in `data-raw`): [CC0](data-raw/LICENSE)
