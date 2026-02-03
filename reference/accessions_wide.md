# GenBank accessions used in the Fern Tree of Life (FTOL), wide format

One row per species.

## Usage

``` r
accessions_wide
```

## Format

A tibble (data frame) with 5615 rows and 13 columns.

- species:

  Species name; matches names of tips in tree

- atpA:

  GenBank accession number for atpA

- atpB:

  GenBank accession number for atpB

- matK:

  GenBank accession number for matK

- rbcL:

  GenBank accession number for rbcL

- rps4:

  GenBank accession number for rps4

- rps4-trnS:

  GenBank accession number for rps4-trnS

- trnL-trnF:

  GenBank accession number for trnL-trnF

- plastome:

  GenBank accession number for plastomes

- join_by:

  Method used to join loci

- specimen_voucher:

  Specimen voucher

- publication:

  Publication

- outgroup:

  Logical; TRUE for outgroup taxa, FALSE for ingroup taxa (ferns)

## Details

`join_by` only provided for Sanger (non-plastome) sequences.
`specimen_voucher` and `publication` only provided for Sanger
(non-plastome) sequences, and only if these were the same across all
loci. `specimen_voucher` has been converted to lower case, alpha-numeric
characters only to account for orthographic variation in GenBank data.

For details on methods used to infer the tree, see Nitta et al. 2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768
