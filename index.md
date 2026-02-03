# ftolr

[ftolr](https://fernphy.github.io/ftolr/) is an R package that provides
access to the [Fern Tree of Life (FTOL)](https://fernphy.github.io/) and
related datasets.

These data were originally compiled using methods described in this
paper:

- Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. 2022. An open
  and continuously updated fern tree of life. *Frontiers in Plant
  Science* 13, <https://doi.org/10.3389/fpls.2022.909768>

## Installation

You can install ftolr from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fernphy/ftolr")
```

## Examples

### Fern Tree of Life (FTOL)

The [`ft_tree()`](https://fernphy.github.io/ftolr/reference/ft_tree.md)
function loads FTOL into the current R session. There are several
options available to control branch lengths, presence or absence of
outgroup, and sampling scheme.

``` r
library(ftolr)
# Default: consensus tree with branchlengths in units of time
ft_tree()
#> 
#> Phylogenetic tree with 6234 tips and 6233 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   100/100, 100/100, 100, 100/100, 100/100, 100/100, ...
#> 
#> Rooted; includes branch length(s).

# Maximum-likelihood (ML) tree with raw branchlengths and outgroup pruned
ft_tree(
  branch_len = "raw",
  consensus = FALSE,
  drop_og = TRUE
) 
#> 
#> Phylogenetic tree with 6216 tips and 6215 internal nodes.
#> 
#> Tip labels:
#>   Acrostichum_danaeifolium, Acrostichum_speciosum, Acrostichum_aureum, Ceratopteris_richardii, Ceratopteris_cornuta, Ceratopteris_pteridoides, ...
#> Node labels:
#>   100/100, 100/100, 100/100, 100, 100, 95/100, ...
#> 
#> Rooted; includes branch length(s).
```

### DNA sequences

The DNA sequences used to build the tree are also available. These can
be subset by locus (gene) name and can be formatted as a matrix (DNA
alignment) or a list.

``` r
# Default: aligned Sanger sequences
ft_seqs()
#> 6235 DNA sequences in binary format stored in a matrix.
#> 
#> All sequences of same length: 13335 
#> 
#> Labels:
#> Acrostichum_danaeifolium
#> Actiniopteris_dimorpha
#> Actiniopteris_semiflabellata
#> Adenophorus_pinnatifidus
#> Adenophorus_tenellus
#> Adiantopsis_alata
#> ...
#> 
#> More than 10 million bases: not printing base composition.
#> (Total: 83.14 Mb)

# Unaligned rbcL
ft_seqs(loci = "rbcL", aligned = FALSE)
#> 5471 DNA sequences in binary format stored in a list.
#> 
#> Mean sequence length: 1258.485 
#>    Shortest sequence: 214 
#>     Longest sequence: 1428 
#> 
#> Labels:
#> Acrostichum_danaeifolium
#> Actiniopteris_dimorpha
#> Actiniopteris_semiflabellata
#> Adenophorus_pinnatifidus
#> Adenophorus_tenellus
#> Adiantopsis_alata
#> ...
#> 
#> Base composition:
#>     a     c     g     t 
#> 0.267 0.217 0.251 0.266 
#> (Total: 6.89 Mb)
```

### FTOL data version

You can check the current version of the [FTOL
data](https://github.com/fernphy/ftol_data) included in `ftolr` with
[`ft_data_ver()`](https://fernphy.github.io/ftolr/reference/ft_data_ver.md):

``` r
ft_data_ver()
#> [1] "1.8.0"
```

## Citing

If you use this package, please cite it!

Here is an example:

- FTOL working group. 2022. ftolr: Data for the Fern Tree of Life (FTOL)
  <https://doi.org/10.5281/zenodo.6401660>

The example DOI above is for the overall package.

Here is the latest DOI, which you should cite if you are using the
latest version of the package:

[![DOI](https://zenodo.org/badge/475787005.svg)](https://zenodo.org/badge/latestdoi/475787005)

Please also cite the paper describing how the data were generated:

- Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. 2022. An open
  and continuously updated fern tree of life. *Frontiers in Plant
  Science* 13, <https://doi.org/10.3389/fpls.2022.909768>

## Licenses

- Code: [MIT](https://fernphy.github.io/ftolr/LICENSE)
- Data ([ftol.zip](https://fernphy.github.io/ftolr/data-raw/ftol.zip)):
  [CC0](https://creativecommons.org/publicdomain/zero/1.0/)
