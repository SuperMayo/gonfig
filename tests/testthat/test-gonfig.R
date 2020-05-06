test_that("Can load", {
  gonfig::get()
})

test_that("Default replacement works", {
  input <- gonfig::get("data")$input
  expect_equal(input, "data/mydf.csv")
  bool <- gonfig::get("truestring")
  expect_equal(bool, "TRUE")
})

test_that("Nested replacement works", {
  expect_equal(gonfig::get("analysis")$output,
               "data/analysis_1929.csv")
})

test_that("You can still use alternative delimiters", {
  expect_equal(gonfig::get("brackets", .open="[", .close="]"),
               "1929")
})

test_that("R expressions still works", {
  expect_equivalent(gonfig::get("expr"), config::get("expr"))
  expect_equivalent(gonfig::get("expr"), "Ok!")
})

test_that("Types are not coerced to character", {
  expect_equal(gonfig::get("year"), 1929)
})

test_that("Expressions in glue works", {
  expect_equal(gonfig::get("yearplus10"), "1939")
  expect_equal(gonfig::get("yearplus20"), "1949")
})

test_that("Inheritance still works", {
  expect_equal(gonfig::get("bool", config="dev"), FALSE)
  expect_equal(gonfig::get("yearplus10", config="dev"), "2010")
})
