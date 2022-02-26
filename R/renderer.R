#' Create a function to render R Markdown with pre-filled options
#'
#' The returned function is compatible with the `knit` YAML front matter field
#' in R Markdown documents, which lets you [customize the `Knit` button in
#' RStudio](https://bookdown.org/yihui/rmarkdown-cookbook/custom-knit.html).
#'
#' @param ... Arguments passed to the underlying rendering function when the
#'   returned function is called.
#' @return A function that takes two arguments, `input` and `encoding`, and
#'   renders the `input` R Markdown document.
#'
#' @name renderer
NULL

#' @describeIn renderer Vanilla R Markdown rendering.
#' @seealso [rmarkdown::render()] used by `rmarkdown_renderer()`.
#' @export
rmarkdown_renderer <- function(...) {
  function(input, encoding = "UTF-8") {
    rmarkdown::render(input, encoding = encoding, ...)
  }
}

#' @describeIn renderer Retains the rendered YAML front matter.
#' @seealso [render()] used by `rmdmatter_renderer()`.
#' @export
rmdmatter_renderer <- function(...) {
  function(input, encoding = "UTF-8") {
    render(input, encoding = encoding, ...)
  }
}

#' @inheritParams render_and_rename
#' @describeIn renderer Retains the rendered YAML front matter, and passes it to
#'   `callback` to rename the output file.
#' @seealso [render_and_rename()] used by `renaming_renderer()`.
#' @export
renaming_renderer <- function(callback, ...) {
  function(input, encoding = "UTF-8") {
    render_and_rename(input, callback, encoding = encoding, ...)
  }
}

# TODO: Think about generalizing to use a common `renderer()` implementation.
