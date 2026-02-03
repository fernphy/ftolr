# Load the Fern Tree of Life (FTOL)

For details on methods used to infer the tree, see Nitta et al. 2022.

## Usage

``` r
ft_tree(
  branch_len = "ultra",
  consensus = TRUE,
  rooted = TRUE,
  backbone = FALSE,
  drop_og = FALSE,
  label_ages = FALSE,
  decimals = NULL
)
```

## Arguments

- branch_len:

  Character vector of length 1; how to treat branch lengths. Must choose
  from `"ultra"` (ultrametric tree, branchlengths in units of time),
  `"raw"` (raw branchlengths in units of genetic change), or `"clado"`
  (cladogram, no branchlengths). Default `"ultra"`.

- consensus:

  Logical vector of length 1; if `TRUE`, the majority-rule extended
  consensus phylogeny will be returned; otherwise returns the
  maximum-likelihood tree. Default `TRUE`.

- rooted:

  Logical vector of length 1; if `TRUE`, the phylogeny will be rooted on
  bryophytes; otherwise the phylogeny is unrooted. Default `TRUE`.

- backbone:

  Logical vector of length 1; if `TRUE`, the backbone phylogeny (only
  species with complete plastomes available) will be returned; otherwise
  the phylogeny will include all species. Default `FALSE`.

- drop_og:

  Logical vector of length 1; if `TRUE`, the outgroup (non-ferns) will
  be excluded; otherwise the outgroup is included. Default `FALSE`.

- label_ages:

  Logical vector of length 1; if `TRUE`, internal nodes will be labeled
  with ages. Only works if `branch_len` is `"ultra".` Default `FALSE`.

- decimals:

  Numeric vector of length 1; number of decimals for rounding node
  labels if `label_ages` is `TRUE`; `null` (default) does no rounding.

## Value

List of class "phylo"; a phylogenetic tree.

## Details

Not all combinations are possible. For example, `branch_len = "ultra"`
is only available if `backbone = FALSE`.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768

## Examples

``` r
# Default is the consensus tree with branchlengths in units of time
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
```
