#' Scatter plot HTML widget
#'
#' Interactive scatter plots based on htmlwidgets and d3.js
#'
#' @param x numerical vector of x values
#' @param y numerical vector of y values
#' @param lab optional character vector of text labels
#' @param point_size points size
#' @param labels_size text labels size
#' @param point_opacity points opacity
#' @param fixed force a 1:1 aspect ratio
#' @param col_var optional vector for points color mapping
#' @param symbol_var optional vector for points symbol mapping
#' @param col_lab color legend title
#' @param symbol_lab symbols legend title
#' @param tooltips logical value to display tooltips when hovering points
#' @param tooltip_text optional character vector of tooltips text
#' @param xlab x axis label
#' @param ylab y axis label
#' @param width figure width, computed when displayed
#' @param height figure height, computed when displayed
#'
#' @description Generates an interactive scatter plot based on d3.js.
#' Interactive features include zooming, panning, text labels moving, tooltips,
#' fading effects in legend. Additional handlers are provided to change label
#' size, point opacity or export the figure as an SVG file via HTML form controls.
#'
#' @author Julien Barnier <julien.barnier@@ens-lyon.fr>
#'
#' @examples
#' scatterD3(x = mtcars$wt, y = mtcars$mpg, lab = rownames(mtcars),
#'           col_var = mtcars$cyl, symbol_var = mtcars$am,
#'           xlab = "Weight", ylab = "Mpg", col_lab = "Cylinders",
#'           symbol_lab = "Manual transmission")
#'
#'
#' @import htmlwidgets
#' @export
#'
scatterD3 <- function(x, y, lab = NULL,
                      point_size = 64, labels_size = 10,
                      point_opacity = 1,
                      fixed = FALSE, col_var = NULL,
                      symbol_var = NULL,
                      col_lab = NULL, symbol_lab = NULL,
                      tooltips = TRUE,
                      tooltip_text = NULL,
                      xlab = NULL, ylab = NULL,
                      width = NULL, height = NULL) {

  if (is.null(xlab)) xlab <- deparse(substitute(x))
  if (is.null(ylab)) ylab <- deparse(substitute(y))
  if (is.null(col_lab)) col_lab <- deparse(substitute(col_var))
  if (is.null(symbol_lab)) symbol_lab <- deparse(substitute(symbol_var))

  # create a list that contains the settings
  settings <- list(
    labels_size = labels_size,
    point_size = point_size,
    point_opacity = point_opacity,
    xlab = xlab,
    ylab = ylab,
    col_var = col_var,
    col_lab = col_lab,
    symbol_var = symbol_var,
    symbol_lab = symbol_lab,
    tooltips = tooltips,
    tooltip_text = tooltip_text,
    fixed = fixed
  )

  data <- data.frame(x=x, y=y)
  if (!is.null(lab)) data <- cbind(data, lab=lab)
  if (!is.null(col_var)) data <- cbind(data, col_var=col_var)
  if (!is.null(symbol_var)) data <- cbind(data, symbol_var=symbol_var)
  if (!is.null(tooltip_text)) data <- cbind(data, tooltip_text=tooltip_text)

  # pass the data and settings using 'x'
  x <- list(
    data = data,
    settings = settings
  )

  # create widget
  htmlwidgets::createWidget(
      name = 'scatterD3',
      x,
      width = width,
      height = height,
      package = 'scatterD3',
      sizingPolicy = htmlwidgets::sizingPolicy(
          browser.fill = TRUE,
          viewer.fill = TRUE
      )
  )
}

#' Widget output function for use in Shiny
#'
#' @export
scatterD3Output <- function(outputId, width = '100%', height = '600px'){
  shinyWidgetOutput(outputId, 'scatterD3', width, height, package = 'scatterD3')
}

#' Widget render function for use in Shiny
#'
#' @export
renderScatterD3 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, scatterD3Output, env, quoted = TRUE)
}
