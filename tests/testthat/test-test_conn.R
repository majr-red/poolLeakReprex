# setConn()

test_that("pool connection is live", {
  conn <- getConn()
  expect_equal(DBI::dbGetQuery(conn,"SELECT 1")[1,1],1)
})

# destroyConn()
