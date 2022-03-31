library(tidyverse)
library(patrick)

# Helper for valid input test
make_valid_ft_seqs_input_cases <- function() {
  # Create all combinations of input
  expand_grid(
    plastome = c(TRUE, FALSE),
    aligned = c(TRUE, FALSE),
    del_gaps = c(TRUE, FALSE),
    drop_og = c(TRUE, FALSE)
  ) %>%
    # Drop some invalid combinations
    filter(!(del_gaps == TRUE & aligned == TRUE)) %>%
    # Evaluate
    mutate(
      expr = pmap(., ft_seqs),
      class = "DNAbin",
      .test_name = paste0("ft_tree_test_valid_", 1:nrow(.))) %>%
    select(.test_name, expr, class)
}

with_parameters_test_that(
  "valid input results in DNA sequences",
  {expect_s3_class(expr, class)},
  .cases = make_valid_ft_seqs_input_cases()
)
