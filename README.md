# rmdmatter

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of rmdmatter is to help you make the most of the YAML front matter in your R Markdown document.

## Installation

You can install the development version of rmdmatter from GitHub with:

``` r
remotes::install_github("mikmart/rmdmatter")
```

## Example

Use your YAML front matter to rename an output file rendered with `rmdmatter::render()`:

``` r
library(rmdmatter)

output_file <- render(input_file)
rename_rendered(output_file, function(metadata) {
  with(metadata, paste(title, "by", author, "on", date))
})
```

Or use a helper directly in the `knit` field of your front matter to integrate with the RStudio `Knit` button:

``` markdown
---
title: "Untitled"
author: "Jane Doe"
date: "`r Sys.Date()`"
output: html_document
knit: |
  rmdmatter::renaming_renderer(function(metadata) {
    with(metadata, paste(title, "by", author, "on", date))
  })
---

204 No Content
```
