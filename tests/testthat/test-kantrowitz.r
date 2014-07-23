source("sample-data.r")
context("Kantrowitz")


# Test a single name
single        <- gender("madison", method = "kantrowitz")

# Test multiple names with same years
multiple_same <- gender(sample_names_data, method = "kantrowitz")

# Test a missing name
missing       <- gender("zzzzz", method = "kantrowitz")

test_that("a single name can be encoded", {
  expect_that(single$gender, equals("male"))
})

test_that("a single name returns a list with the name and gender", {
  expect_that(class(single), equals("list"))
  expect_that(length(single), equals(2))
  expect_that(names(single), equals(c("name", "gender")))
})

test_that("multiple names returns a list of lists", {
  expect_that(class(multiple_same), equals("list"))
  expect_that(length(multiple_same), equals(length(sample_names_data)))
  expect_that(names(multiple_same[[1]]), equals(c("name", "gender")))
})

test_that("a name not in the data set is marked as such and not dropped", {
  expect_that(missing$gender, is_equivalent_to(as.factor("not in data")))
})
