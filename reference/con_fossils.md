# Fossil calibration points used for dating Fern Tree of Life (FTOL)

`con_fossils` was used for the consensus tree; `ml_fossils` was used for
the ML tree.

## Usage

``` r
con_fossils

ml_fossils
```

## Format

A tibble (data frame) with 54 rows and 12 columns.

- n_fos:

  Unique ID number for fossil

- minimum_age:

  Minimum age to apply to fossil constraint

- node_calibrated:

  Node calibrated by fossil constraint. Combination of 'affinities' and
  'affinities_group'

- fossil_taxon:

  Taxonomic name of fossil (without author)

- affinities_group:

  Type of group the fossil belongs to (crown or stem)

- affinities:

  Narrowest clade the fossil belongs to; the clade whose date is
  constrained by the fossil

- monophyly:

  Are the affinities monophyletic? 'Yes', 'No', or 'Monotypic'

- number_tips:

  Number of tips in the clade constrained by the fossil

- mrca:

  Node number of MRCA for the clade constrained by the fossil

- stem_mrca:

  Node number of the parent node of the MRCA for the clade constrained
  by the fossil

- tip_1:

  Name of one taxon that defines the clade constrained by the fossil

- tip_2:

  Name of another taxon that defines the clade constrained by the fossil

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 54 rows and 12 columns.

## Details

The fossils in `con_fossils` and `ml_fossils` are generally the same,
but the node each calibrates may differ between the trees because of
differences in topology. Also, in some cases, a given fossil may only be
applied to the ML or consensus tree (not both) because the topology of
the tree makes that fossil redundant with another fossil.

The node corresponding to the fossil constraint is defined as the most
recent common ancestor (MRCA, column 'mrca') of two tips columns
('tip_1' and 'tip_2') for crown affinities, or its parent node (column
'stem_mrca') for stem affinities. The two tips are identified
automatically for monophyletic clades, or by hand for non-monophyletic
clades. 'mrca' is not defined for monotypic groups (only 'stem_mrca').

Does not include the constraint on the root of the tree.

For further details on methods used for molecular dating, see Nitta et
al. 2022.

## References

Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An open
and continuously updated fern tree of life.
https://doi.org/10.3389/fpls.2022.909768
