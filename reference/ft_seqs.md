# Load the DNA sequences used to build the Fern Tree of Life (FTOL)

For details about the data, see
[plastome_alignment](https://fernphy.github.io/ftolr/reference/plastome_alignment.md)
for plastome sequences and
[sanger_alignment](https://fernphy.github.io/ftolr/reference/sanger_alignment.md)
for Sanger sequences.

## Usage

``` r
ft_seqs(
  loci = NULL,
  plastome = FALSE,
  aligned = TRUE,
  del_gaps = ifelse(is.null(loci), FALSE, TRUE),
  drop_og = FALSE
)
```

## Arguments

- loci:

  Character vector (optional); names of loci to include in the output.
  If `NULL` (default), all loci will be included. For a list of valid
  locus names, see
  [plastome_parts](https://fernphy.github.io/ftolr/reference/plastome_parts.md)
  for plastome loci and
  [sanger_parts](https://fernphy.github.io/ftolr/reference/sanger_parts.md)
  for Sanger loci.

- plastome:

  Logical vector of length 1; If `TRUE`, the alignment will include loci
  and species with complete plastomes available; otherwise will include
  Sanger loci and all species. Default `FALSE`.

- aligned:

  Logical vector of length 1; If `TRUE`, the output will be aligned
  sequences (matrix); otherwise will be unaligned (list). Default
  `TRUE`.

- del_gaps:

  Logical vector of length 1; If `TRUE`, all gaps will be deleted from
  the alignment. Default is `TRUE` if `loci` is `NULL`, `FALSE`
  otherwise.

- drop_og:

  Logical vector of length 1; If `TRUE`, the outgroup (non-ferns) will
  be excluded; otherwise the outgroup is included. Default `FALSE`.

## Value

List or matrix of class "DNAbin"; DNA sequences.

## Details

After subsetting loci, columns / rows consisting of only gaps will be
deleted regardless of `del_gaps` argument (`del_gaps` deletes *all*
gaps, typically resulting in unaligned sequences).

For details on methods used to assemble alignments, see Nitta et al.
2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768

## Examples

``` r
# Default is aligned Sanger sequences
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
```
