test_that("ft_data_ver works", {
  expect_equal(
    ft_data_ver(), "1.2.1"
  )
  expect_equal(
    ft_data_ver("gb"), "251"
  )
  expect_equal(
    ft_data_ver("cutoff"), "2022-08-15"
  )
  expect_error(
    ft_data_ver("foo", "'what' must be one of 'ftol', 'gb', or 'cutoff'")
  )
  expect_error(
    ft_data_ver(c(1, 2)), "'what' must be a character vector of length 1"
  )
})
