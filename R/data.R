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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
"sanger_parts"

# trees ----

#' Fern Tree of Life (FTOL) backbone phylogeny
#'
#' A maximum-likelihood phylogenetic tree inferred from whole fern plastomes,
#' including maximal sampling of available species on GenBank.
#'
#' Includes `r ape::Ntip(backbone_tree) |> scales::number(big.mark = ",")`
#' tips and `r ape::Nnode(backbone_tree) |> scales::number(big.mark = ",")`
#' internal nodes. Branch lengths are in units of estimated genetic change per
#' site (not ultrametric). Node labels are bootstrap support (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
"backbone_tree"

#' Fern Tree of Life (FTOL) maximum-likelihood phylogeny
#'
#' A maximum-likelihood phylogenetic tree of ferns inferred from seven loci,
#' including maximal sampling of available species on GenBank.
#'
#' Includes `r ape::Ntip(ftol_ml_tree)` tips and `r ape::Nnode(ftol_ml_tree)`
#' internal nodes. Branch lengths are in units of estimated genetic change per
#' site (not ultrametric). Node labels are bootstrap support (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
"ftol_ml_tree"

#' Fern Tree of Life (FTOL) dated phylogeny
#'
#' A phylogenetic tree of ferns inferred from seven loci and dated using 60
#' fossil ferns as constraints, including maximal sampling of available species
#' on GenBank
#'
#' Includes `r ape::Ntip(ftol_time_tree)` tips and
#' `r ape::Nnode(ftol_time_tree)` internal nodes. Branch lengths are in units of
#' time (Ma). Node labels are bootstrap support (%).
#'
#' For details on methods used to infer the tree, see Nitta et al. 2022.
#'
#' @format List of class "phylo"
#' @references Nitta JH, Schuettpelz E, Ramírez-Barahona S, Iwasaki W. (2022) An
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
"ftol_time_tree"

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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
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
#'   open and continuously updated Fern Tree of Life (FTOL). FIXME ADD DOI
"ftol_ferns"
