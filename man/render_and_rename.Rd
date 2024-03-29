% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render.R
\name{render_and_rename}
\alias{render_and_rename}
\title{Render R Markdown to a file based on rendered metadata}
\usage{
render_and_rename(input, callback, ..., quiet = FALSE)
}
\arguments{
\item{input}{The input file to be rendered. This can be an R script (.R),
an R Markdown document (.Rmd), or a plain markdown document.}

\item{callback}{A function that gets the rendered R Markdown YAML front
matter metadata as an argument, and returns a new name for \code{file}. Any
changes implied to the directory or file extension are ignored -- only the
name is changed.}

\item{...}{
  Arguments passed on to \code{\link[=render]{render}}
  \describe{
    \item{\code{}}{}
  }}

\item{quiet}{An option to suppress printing during rendering from knitr,
pandoc command line and others. To only suppress printing of the last
"Output created: " message, you can set \code{rmarkdown.render.message} to
\code{FALSE}}
}
\description{
Render an R Markdown file, and use the rendered YAML front matter to
construct a dynamic output file name. A thin wrapper for \code{\link[=render]{render()}} followed
by \code{\link[=rename_rendered]{rename_rendered()}}, that also prints a helpful message for interactive
use.
}
\seealso{
\code{\link[=renaming_renderer]{renaming_renderer()}} for easy use in the \code{knit} front matter field.

\code{\link[=render]{render()}} and \code{\link[=rename_rendered]{rename_rendered()}}, which this function wraps.
}
