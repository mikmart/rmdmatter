#' Render R Markdown and retain the front matter
#'
#' Render an R Markdown file and retain the rendered YAML front matter metadata.
#'
#' @inheritDotParams rmarkdown::render
#'
#' @seealso [rename_rendered()] to use the retained metadata to rename the
#'   output file.
#' @seealso [render_and_rename()] to do the rendering and renaming in one step.
#' @seealso [renderer] to pre-specify arguments, useful e.g. in the `knit` front
#'   matter field.
#'
#' @importFrom rlang %||%
#' @export
render <- function(...) {
  args <- list(...)

  # Ensure intermediate Markdown is kept initially
  keep_md <- args$output_options$keep_md %||% FALSE
  args$output_options$keep_md <- TRUE

  output_file <- do.call(rmarkdown::render, args)

  # Extract rendered front matter from Markdown file
  md_file <- fs::path_ext_set(output_file, ".md")
  metadata <- rmarkdown::yaml_front_matter(md_file)

  # Clean up if user didn't request Markdown to be kept
  if (!keep_md) {
    fs::file_delete(md_file)
  }

  # Attach metadata as an attribute to the output
  rmd_metadata(output_file) <- metadata

  output_file
}

rmd_metadata <- function(x) {
  attr(x, "rmdmatter_metadata")
}

`rmd_metadata<-` <- function(x, value) {
  attr(x, "rmdmatter_metadata") <- value
  x
}

#' Render R Markdown to a file based on rendered metadata
#'
#' Render an R Markdown file, and use the rendered YAML front matter to
#' construct a dynamic output file name. A thin wrapper for [render()] followed
#' by [rename_rendered()], that also prints a helpful message for interactive
#' use.
#'
#' @inheritParams rmarkdown::render
#' @inheritDotParams render
#' @inheritParams rename_rendered
#'
#' @seealso [renaming_renderer()] for easy use in the `knit` front matter field.
#' @seealso [render()] and [rename_rendered()], which this function wraps.
#'
#' @export
render_and_rename <- function(input, callback, ..., quiet = FALSE) {
  output_file <- render(input, ..., quiet = quiet)

  renamed_file <- rename_rendered(output_file, callback)
  if (!quiet) {
    message("Output renamed to: ", fs::path_file(renamed_file))
  }

  invisible(renamed_file)
}
