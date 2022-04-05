# accessions ----

#' GenBank accessions used in the Fern Tree of Life (FTOL), long format
#'
#' One row per accession.
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format A tibble (data frame) with `r nrow(accessions_long)` rows and
#' `r ncol(accessions_long)` columns.
#' \describe{
#'   \item{species}{Species name; matches names of tips in tree}
#'   \item{locus}{Name of locus (gene or intergenic spacer region)}
#'   \item{accession}{GenBank accession number}
#'   \item{seq_len}{Sequence length (bp), excluding any missing or ambiguous bases}
#'   \item{sci_name}{Scientific name used in FTOL}
#'   \item{ncbi_name}{Scientific name used in the NCBI taxonomic database}
#'   \item{ncbi_taxid}{NCBI taxonomy database unique identifier}
#'   \item{outgroup}{Logical; TRUE for outgroup taxa, FALSE for ingroup
#'   taxa (ferns)}
#'   }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"accessions_long"

#' GenBank accessions used in the Fern Tree of Life (FTOL), wide format
#'
#' One row per species.
#'
#' `join_by` only provided for Sanger (non-plastome) sequences.
#' `specimen_voucher` and `publication` only provided for Sanger
#' (non-plastome) sequences, and only if these were the same across all loci.
#' `specimen_voucher` has been converted to lower case, alpha-numeric
#' characters only to account for orthographic variation in GenBank data.
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format A tibble (data frame) with `r nrow(accessions_wide)` rows and
#' `r ncol(accessions_wide)` columns.
#' \describe{
#'   \item{species}{Species name; matches names of tips in tree}
#'   \item{atpA}{GenBank accession number for atpA}
#'   \item{atpB}{GenBank accession number for atpB}
#'   \item{matK}{GenBank accession number for matK}
#'   \item{rbcL}{GenBank accession number for rbcL}
#'   \item{rps4}{GenBank accession number for rps4}
#'   \item{rps4-trnS}{GenBank accession number for rps4-trnS}
#'   \item{trnL-trnF}{GenBank accession number for trnL-trnF}
#'   \item{plastome}{GenBank accession number for plastomes}
#'   \item{join_by}{Method used to join loci}
#'   \item{specimen_voucher}{Specimen voucher}
#'   \item{publication}{Publication}
#'   \item{outgroup}{Logical; TRUE for outgroup taxa, FALSE for ingroup
#'   taxa (ferns)}
#'   }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"accessions_wide"

# alignments ----

#' Aligned plastome DNA sequences used to build Fern Tree of Life (FTOL)
#'
#' Concatenation of `r dplyr::n_distinct(plastome_parts$locus)` loci from whole
#' fern plastomes, including maximal sampling of available species on GenBank.
#'
#' Includes `r nrow(plastome_alignment) |> scales::number(big.mark = ",")`
#' species and
#' `r ncol(plastome_alignment) |> scales::number(big.mark = ",")`
#' bases.
#'
#' For details on methods used to assemble alignment, see Nitta et al. 2022.
#'
#' @format Matrix of class "DNAbin"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"plastome_alignment"

#' Aligned (mostly) Sanger DNA sequences used to build Fern Tree of Life (FTOL)
#'
#' Concatenation of `r dplyr::n_distinct(sanger_parts$locus)` loci primarily
#' obtained from Sanger sequencing, including maximal sampling of available
#' species on GenBank.
#'
#' Includes `r nrow(sanger_alignment) |> scales::number(big.mark = ",")`
#' species and `r ncol(sanger_alignment) |> scales::number(big.mark = ",")`
#' bases.
#'
#' For details on methods used to assemble alignment, see Nitta et al. 2022.
#'
#' @format Matrix of class "DNAbin"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"sanger_alignment"

#' Start and end positions of loci in plastome DNA sequence alignment
#'
#' These data can be used to extract portions of the plastome DNA sequence
#' alignment ([plastome_alignment]) corresponding to individual loci.
#'
#' For details on methods used to assemble alignment, see Nitta et al. 2022.
#'
#' @format A tibble (data frame) with `r nrow(plastome_parts)` rows and
#' `r ncol(plastome_parts)` columns.
#' \describe{
#'   \item{locus}{Name of locus (gene or intergenic spacer region)}
#'   \item{start}{Start position (column number) of locus in concatenated DNA
#'     alignment}
#'   \item{end}{End position (column number) of locus in concatenated DNA
#'     alignment}
#'   }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"plastome_parts"

#' Start and end positions of loci in Sanger DNA sequence alignment
#'
#' These data can be used to extract portions of the Sanger DNA sequence
#' alignment ([sanger_alignment]) corresponding to individual loci.
#'
#' For details on methods used to assemble alignment, see Nitta et al. 2022.
#'
#' @format A tibble (data frame) with `r nrow(sanger_parts)` rows and
#' `r ncol(sanger_parts)` columns.
#' \describe{
#'   \item{locus}{Name of locus (gene or intergenic spacer region)}
#'   \item{start}{Start position (column number) of locus in concatenated DNA
#'     alignment}
#'   \item{end}{End position (column number) of locus in concatenated DNA
#'     alignment}
#'   }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"sanger_parts"

# fossils ----

#' Fossil calibration points used for dating Fern Tree of Life (FTOL)
#'
#' `con_fossils` was used for the consensus tree; `ml_fossils` was used for the
#' ML tree.
#'
#' The fossils in `con_fossils` and `ml_fossils` are generally the same, but the
#' node each calibrates may differ between the trees because of differences in
#' topology. Also, in some cases, a given fossil may only be applied to the ML
#' or consensus tree (not both) because the topology of the tree makes that
#' fossil redundant with another fossil.
#'
#' The node corresponding to the fossil constraint is defined as the most recent
#' common ancestor (MRCA, column 'mrca') of two tips columns ('tip_1' and
#' 'tip_2') for crown affinities, or its parent node (column 'stem_mrca') for
#' stem affinities. The two tips are identified automatically for monophyletic
#' clades, or by hand for non-monophyletic clades. 'mrca' is not defined for
#' monotypic groups (only 'stem_mrca').
#'
#' Does not include the constraint on the root of the tree.
#'
#' For further details on methods used for molecular dating, see
#' Nitta et al. 2022.
#'
#' @format A tibble (data frame) with `r nrow(con_fossils)` rows and
#' `r ncol(con_fossils)` columns.
#' \describe{
#'   \item{n_fos}{Unique ID number for fossil}
#'   \item{minimum_age}{Minimum age to apply to fossil constraint}
#'   \item{node_calibrated}{Node calibrated by fossil constraint.
#'     Combination of 'affinities' and 'affinities_group'}
#'   \item{fossil_taxon}{Taxonomic name of fossil (without author)}
#'   \item{affinities_group}{Type of group the fossil belongs to (crown or stem)}
#'   \item{affinities}{Narrowest clade the fossil belongs to; the clade whose
#'     date is constrained by the fossil}
#'   \item{monophyly}{Are the affinities monophyletic? 'Yes', 'No', or
#'     'Monotypic'}
#'   \item{number_tips}{Number of tips in the clade constrained by the fossil}
#'   \item{mrca}{Node number of MRCA for the clade constrained by the fossil}
#'   \item{stem_mrca}{Node number of the parent node of the MRCA for
#'     the clade constrained by the fossil}
#'  \item{tip_1}{Name of one taxon that defines the clade constrained by the
#'    fossil}
#'  \item{tip_2}{Name of another taxon that defines the clade constrained by the
#'    fossil}
#'   }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"con_fossils"

#' @rdname con_fossils
"ml_fossils"

# trees ----

#' Fern Tree of Life (FTOL) backbone phylogeny
#'
#' Majority-rule extended consensus phylogenetic tree inferred from whole fern
#' plastomes by maximum-likelihood, including maximal sampling of available
#' species on GenBank.
#'
#' Includes
#' `r ape::Ntip(backbone_tree) |> scales::number(big.mark = ",")`
#' tips and
#' `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of estimated genetic change per
#' site (not ultrametric). Node labels are bootstrap support (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"backbone_tree"

#' Fern Tree of Life (FTOL) maximum-likelihood phylogeny
#'
#' A maximum-likelihood (ML) phylogenetic tree of ferns inferred from seven
#' loci, including maximal sampling of available species on GenBank.
#'
#' A [backbone phylogeny][backbone_tree] based on full plastome sequences
#' including
#' `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' tips was first inferred and used as a constraint tree for the ML tree.
#'
#' Includes
#' `r ape::Ntip(ftol_ml_tree) |> scales::number(big.mark = ",")`
#' tips and
#' `r ape::Nnode(ftol_ml_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of estimated genetic change per
#' site (not ultrametric). Node labels are bootstrap support (BS) values (%)
#' separated by a forward slash. BS value before the slash is BS calculated
#' from the full (Sanger) sampling; BS value after the slash is BS calculated
#' from the backbone (plastome) sampling.
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"ftol_ml_tree"

#' Fern Tree of Life (FTOL) dated maximum-likelihood phylogeny
#'
#' A maximum-likelihood (ML) phylogenetic tree of ferns inferred from seven loci
#' and dated using fossil ferns as constraints, including maximal sampling of
#' available species on GenBank.
#'
#' A [backbone phylogeny][backbone_tree] based on full plastome
#' sequences including
#' `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' tips was first inferred and used as a constraint tree for the ML tree.
#'
#' Includes
#' `r ape::Ntip(ftol_ml_dated_tree) |> scales::number(big.mark = ",")`
#' tips and
#' `r ape::Nnode(ftol_ml_dated_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of time (Ma). Node labels are
#' bootstrap support (BS) values (%) separated by a forward slash. BS value
#' before the slash is BS calculated from the full (Sanger) sampling; BS value
#' after the slash is BS calculated from the backbone (plastome) sampling.
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"ftol_ml_dated_tree"

#' Fern Tree of Life (FTOL) consensus phylogeny
#'
#' Majority-rule extended consensus phylogenetic tree of ferns inferred from
#' seven loci by maximum-likelihood, including maximal sampling of available
#' species on GenBank.
#'
#' A [backbone phylogeny][backbone_tree] based on full plastome sequences
#' including
#' `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' tips was first inferred and used as a constraint tree for the consensus tree.
#'
#' Includes
#' `r ape::Ntip(ftol_con_tree) |> scales::number(big.mark = ",")`
#' tips and
#' `r ape::Nnode(ftol_con_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of estimated genetic change per
#' site (not ultrametric). Node labels are bootstrap support (BS) values (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"ftol_con_tree"

#' Fern Tree of Life (FTOL) dated consensus phylogeny
#'
#' Majority-rule extended consensus phylogenetic tree of ferns inferred from
#' seven loci by maximum-likelihood and dated using 60 fossil ferns as
#' constraints, including maximal sampling of available species on GenBank.
#'
#' A [backbone phylogeny][backbone_tree] based on full plastome sequences
#' including
#' `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' tips was first inferred and used as a constraint tree for the consensus tree.
#'
#' Includes
#' `r ape::Ntip(ftol_con_dated_tree) |> scales::number(big.mark = ",")`
#' tips and
#' `r ape::Nnode(ftol_con_dated_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of time (Ma). Node labels are
#' bootstrap support (BS) values (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"ftol_con_dated_tree"

# taxonomy ----

#' Fern Tree of Life (FTOL) taxonomic data
#'
#' Taxonomic data for species included in FTOL. For compact printing, it is
#' recommended to use the `tibble` library (`library(tibble)`).
#'
#' Taxonomy follows Pteridophyte Phylogeny Group I (2016).
#'
#' @format A tibble (data frame) with `r nrow(ftol_taxonomy)` rows and
#' `r ncol(ftol_taxonomy)` columns.
#' \describe{ \item{species}{Species name}
#'   \item{genus}{Genus name}
#'   \item{subfamily}{Subfamily name}
#'   \item{family}{Family name}
#'   \item{suborder}{Suborder name}
#'   \item{order}{Order name}
#'   \item{major_clade}{Informal higher level clade
#'   name, either order or suborder}
#'   \item{outgroup}{Logical; TRUE for outgroup taxa, FALSE for ingroup
#'   taxa (ferns)} }
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
#' @references Pteridophyte Phylogeny Group I (2016) A community-derived
#'   classification for extant lycophytes and ferns. Journal of Systematics and
#'   Evolution 54:563–603. \url{https://doi.org/10.1111/jse.12229}
#'
"ftol_taxonomy"

#' Fern Tree of Life (FTOL) fern species
#'
#' Fern species names included in FTOL in alphabetical order. All species names
#' are unique. Includes `r length(ftol_ferns)` species.
#'
#' @format Character vector
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). https://doi.org/10.1101/2022.03.31.486640
"ftol_ferns"
