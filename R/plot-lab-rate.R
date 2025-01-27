plot_lab_rate <- function(dt, fill_var = NULL) {

  afcharts::use_afcharts()

  p <- dt |>
    ggplot2::ggplot(aes(x = year, y = lab_rate)) +
    ggplot2::geom_col(aes(fill = if(!is.null(fill_var)) get(fill_var))) +
    ggplot2::scale_y_continuous(labels = scales::percent) +
    ggplot2::labs(
      x = NULL,
      y = NULL
    ) +
    ggplot2::theme(
      legend.position = if(is.null(fill_var)) "none" else "right",
      plot.title.position = "plot"
    )
 
  return(p)
}
