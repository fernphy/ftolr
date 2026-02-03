# Fern Tree of Life (FTOL) taxonomic name matching results

Results of taxonomic name matching and resolution for species included
in FTOL. Original names from the NCBI taxonomic database
(https://www.ncbi.nlm.nih.gov/taxonomy) were matched to those in
pteridocat (https://github.com/fernphy/pteridocat), and synonyms
resolved to their accepted names in pteridocat. For compact printing, it
is recommended to use the `tibble` library
([`library(tibble)`](https://tibble.tidyverse.org/)).

## Usage

``` r
ftol_match_results
```

## Format

A tibble (data frame) with 6476 rows and 7 columns.

- query:

  Queried taxonomic name from NCBI

- resolved_name:

  Resolved name used in FTOL

- matched_name:

  Name matching query in pteridocat

- resolved_status:

  Taxonomic status of resolved name

- matched_status:

  Taxonomic status of matched name

- match_type:

  Type of match assigned by taxontools

- taxid:

  NCBI taxonomic ID

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768

Pteridophyte Phylogeny Group I (2016) A community-derived classification
for extant lycophytes and ferns. Journal of Systematics and Evolution
54:563–603. <https://doi.org/10.1111/jse.12229>
