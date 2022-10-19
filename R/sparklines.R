#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
sparklines <- function(data, ..., width = NULL, height = NULL) {

  # describe a React component to send to the browser for rendering.
  content <- reactR::component(
    "Sparklines",
    list(data = data, ...)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'sparklines',
    reactR::reactMarkup(content),
    width = width,
    height = height,
    package = 'sparklines'
  )
}

#' @export
sparklinesLine <- function(...) {
  reactR::React$SparklinesLine(...)
}

#' @export
sparklinesSpots <- function(...) {
  reactR::React$SparklinesSpots(...)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.sparklines <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for sparklines
#'
#' Output and render functions for using sparklines within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a sparklines
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name sparklines-shiny
#'
#' @export
sparklinesOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'sparklines', width, height, package = 'sparklines')
}

#' @rdname sparklines-shiny
#' @export
renderSparklines <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sparklinesOutput, env, quoted = TRUE)
}
