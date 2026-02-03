# Fern Tree of Life (FTOL) dated maximum-likelihood phylogeny

A maximum-likelihood (ML) phylogenetic tree of ferns inferred from seven
loci and dated using fossil ferns as constraints, including maximal
sampling of available species on GenBank.

## Usage

``` r
ftol_ml_dated_tree
```

## Format

List of class "phylo"

## Details

A [backbone
phylogeny](https://fernphy.github.io/ftolr/reference/backbone_tree.md)
based on full plastome sequences including 503 tips was first inferred
and used as a constraint tree for the ML tree.

Includes 5,610 tips and 5,609 internal nodes. Branch lengths are in
units of time (Ma). Node labels are bootstrap support (BS) values (%)
separated by a forward slash. BS value before the slash is BS calculated
from the full (Sanger) sampling; BS value after the slash is BS
calculated from the backbone (plastome) sampling.

For details on methods used to infer the tree, see Nitta et al. 2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768
