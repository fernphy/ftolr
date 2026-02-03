# Current Fern Tree of Life (FTOL) version and related metadata

Current Fern Tree of Life (FTOL) version and related metadata

## Usage

``` r
ft_data_ver(what = "ftol")
```

## Arguments

- what:

  Character vector of length 1; what type of data to return. Must choose
  from "ftol" (FTOL data version; default), "gb" (version of GenBank
  data used to build FTOL), or "cutoff" (cutoff date of GenBank data).

## Value

Character vector of length 1

## Details

FTOL is built from DNA sequence data obtained from the NCBI GenBank FTP
server (<https://ftp.ncbi.nlm.nih.gov/genbank/>), which releases updated
datasets periodically. For more information about the current GenBank
data release, see the [release
notes](https://ftp.ncbi.nlm.nih.gov/genbank/gbrel.txt).

## Examples

``` r
ft_data_ver()
#> [1] "1.8.0"
```
