% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rename.R
\name{rename_rendered}
\alias{rename_rendered}
\title{Rename a rendered file with YAML front matter metadata}
\usage{
rename_rendered(file, callback)
}
\arguments{
\item{file}{A string that gives the path to the file to rename. Should be the
result of \code{\link[=render]{render()}} in order to have metadata attached.}

\item{callback}{A function that gets the rendered R Markdown YAML front
matter metadata as an argument, and returns a new name for \code{file}. Any
changes implied to the directory or file extension are ignored -- only the
name is changed.}
}
\value{
A string that gives the path to the renamed file.
}
\description{
Rename a rendered file with YAML front matter metadata
}
\examples{
\dontrun{
# Make sure to use rmdmatter's render() to have metadata available
output_file <- rmdmatter::render(input_file)
rename_rendered(output_file, function(metadata) {
  with(metadata, paste(title, "by", author, "on", date))
})
}
}
\seealso{
\code{\link[=render]{render()}} for creating an object to use as the \code{file} argument.
}
