library(tidyverse)
library(patrick)

# Helper for valid input test
make_valid_ft_input_cases <- function() {
  # Create all combinations of input
  expand_grid(
    branch_len = c("ultra", "raw", "clado"),
    consensus = c(TRUE, FALSE),
    rooted = c(TRUE, FALSE),
    backbone = c(TRUE, FALSE),
    drop_og = c(TRUE, FALSE)
  ) %>%
    # Drop some invalid combinations
    filter(!(backbone == TRUE & branch_len == "ultra")) %>%
    filter(!(backbone == TRUE & consensus == FALSE)) %>%
    # Evaluate
    mutate(
      expr = pmap(., ft_tree),
      class = "phylo",
      .test_name = paste0("ft_tree_test_valid_", 1:nrow(.))) %>%
    select(.test_name, expr, class)
}

with_parameters_test_that(
  "valid input results in a phylogeny",
  {expect_s3_class(expr, class)},
  .cases = make_valid_ft_input_cases()
)

test_that("invalid input results in error", {
  expect_error(
    ft_tree(backbone = TRUE, branch_len = "ultra"),
    "Backbone tree not available with ultrametric \\(dated\\) branchlengths"
  )
  expect_error(
    ft_tree(backbone = TRUE, consensus = FALSE, branch_len = "raw"),
    "Backbone tree only available as consensus tree"
  )
  expect_error(
    ft_tree(label_ages = TRUE, branch_len = "raw"),
    "Age labeling at nodes only allowed with ultrametric"
  )
})
