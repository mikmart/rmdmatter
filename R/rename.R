#' Rename a rendered file with YAML front matter metadata
#'
#' @param file A string that gives the path to the file to rename. Should be the
#'   result of [render()] in order to have metadata attached.
#' @param callback A function that gets the rendered R Markdown YAML front
#'   matter metadata as an argument, and returns a new name for `file`. Any
#'   changes implied to the directory or file extension are ignored -- only the
#'   name is changed.
#'
#' @return A string that gives the path to the renamed file.
#' @seealso [render()] for creating an object to use as the `file` argument.
#'
#' @export
rename_rendered <- function(file, callback) {
  metadata <- rmd_metadata(file)

  new_name <- fs::path_file(callback(metadata))
  new_file <- fs::path_ext_set(new_name, fs::path_ext(file))
  new_path <- fs::path(fs::path_dir(file), new_file)

  fs::file_move(file, new_path)
}
