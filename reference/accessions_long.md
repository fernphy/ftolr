# GenBank accessions used in the Fern Tree of Life (FTOL), long format

One row per accession.

## Usage

``` r
accessions_long
```

## Format

A tibble (data frame) with 14965 rows and 8 columns.

- species:

  Species name; matches names of tips in tree

- locus:

  Name of locus (gene or intergenic spacer region)

- accession:

  GenBank accession number

- seq_len:

  Sequence length (bp), excluding any missing or ambiguous bases

- sci_name:

  Scientific name used in FTOL

- ncbi_name:

  Scientific name used in the NCBI taxonomic database

- ncbi_taxid:

  NCBI taxonomy database unique identifier

- outgroup:

  Logical; TRUE for outgroup taxa, FALSE for ingroup taxa (ferns)

## Details

For details on methods used to infer the tree, see Nitta et al. 2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768
