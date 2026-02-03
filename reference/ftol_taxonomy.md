# Fern Tree of Life (FTOL) taxonomic data

Taxonomic data for species included in FTOL. For compact printing, it is
recommended to use the `tibble` library
([`library(tibble)`](https://tibble.tidyverse.org/)).

## Usage

``` r
ftol_taxonomy
```

## Format

A tibble (data frame) with 5611 rows and 8 columns.

- species:

  Species name

- genus:

  Genus name

- subfamily:

  Subfamily name

- family:

  Family name

- suborder:

  Suborder name

- order:

  Order name

- major_clade:

  Informal higher level clade name, either order or suborder

- outgroup:

  Logical; TRUE for outgroup taxa, FALSE for ingroup taxa (ferns)

## Details

Taxonomy follows Pteridophyte Phylogeny Group I (2016).

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768

Pteridophyte Phylogeny Group I (2016) A community-derived classification
for extant lycophytes and ferns. Journal of Systematics and Evolution
54:563–603. <https://doi.org/10.1111/jse.12229>
