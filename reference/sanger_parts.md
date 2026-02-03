# Start and end positions of loci in Sanger DNA sequence alignment

These data can be used to extract portions of the Sanger DNA sequence
alignment
([sanger_alignment](https://fernphy.github.io/ftolr/reference/sanger_alignment.md))
corresponding to individual loci.

## Usage

``` r
sanger_parts
```

## Format

A tibble (data frame) with 7 rows and 3 columns.

- locus:

  Name of locus (gene or intergenic spacer region)

- start:

  Start position (column number) of locus in concatenated DNA alignment

- end:

  End position (column number) of locus in concatenated DNA alignment

## Details

For details on methods used to assemble alignment, see Nitta et al.
2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768
