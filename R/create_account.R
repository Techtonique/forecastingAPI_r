
#' Create an account for using Techtonique APIs
#'
#' @param base_url a string; where the API is located
#' @param username a string; your username
#' @param password a string; your password
#'
#' @return
#' @export
#'
#' @examples
create_account <- function(base_url = "https://techtonique2.herokuapp.com",
                           username, password)
{
  if (is.character(username) == FALSE)
    stop("'username' must be a string")

  if (is.character(password) == FALSE)
    stop("'password' must be a string")

  headers = c(
    `Content-Type` = 'application/json'
  )

  data <- jsonlite::toJSON(list(username = username, password = password),
                           auto_unbox = TRUE)

  res <- httr::POST(url = paste0(base_url, '/api/users'),
                    config = httr::add_headers(.headers=headers),
                    body = data)

  return(res)
  }


# require(httr)
#
# headers = c(
#   `Content-Type` = 'application/json'
# )
#
# data = '{"username":"tester_r@example.com","password":"pwd"}'
#
# res <- httr::POST(url = 'https://techtonique2.herokuapp.com/api/users',
#                   httr::add_headers(.headers=headers), body = data)
#
# print(res)
