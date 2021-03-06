\name{scatterD3}
\alias{scatterD3}
\title{Scatter plot HTML widget}
\usage{
scatterD3(x, y, lab = NULL, point_size = 64, labels_size = 10,
  point_opacity = 1, fixed = FALSE, col_var = NULL, symbol_var = NULL,
  col_lab = NULL, symbol_lab = NULL, tooltips = TRUE,
  tooltip_text = NULL, xlab = NULL, ylab = NULL, width = NULL,
  height = NULL)
}
\arguments{
  \item{x}{numerical vector of x values}

  \item{y}{numerical vector of y values}

  \item{lab}{optional character vector of text labels}

  \item{point_size}{points size}

  \item{labels_size}{text labels size}

  \item{point_opacity}{points opacity}

  \item{fixed}{force a 1:1 aspect ratio}

  \item{col_var}{optional vector for points color mapping}

  \item{symbol_var}{optional vector for points symbol
  mapping}

  \item{col_lab}{color legend title}

  \item{symbol_lab}{symbols legend title}

  \item{tooltips}{logical value to display tooltips when
  hovering points}

  \item{tooltip_text}{optional character vector of tooltips
  text}

  \item{xlab}{x axis label}

  \item{ylab}{y axis label}

  \item{width}{figure width, computed when displayed}

  \item{height}{figure height, computed when displayed}
}
\description{
Generates an interactive scatter plot based on d3.js.
Interactive features include zooming, panning, text labels
moving, tooltips, fading effects in legend. Additional
handlers are provided to change label size, point opacity
or export the figure as an SVG file via HTML form controls.
}
\details{
Interactive scatter plots based on htmlwidgets and d3.js
}
\examples{
scatterD3(x = mtcars$wt, y = mtcars$mpg, lab = rownames(mtcars),
          col_var = mtcars$cyl, symbol_var = mtcars$am,
          xlab = "Weight", ylab = "Mpg", col_lab = "Cylinders",
          symbol_lab = "Manual transmission")
}
\author{
Julien Barnier <julien.barnier@ens-lyon.fr>
}

