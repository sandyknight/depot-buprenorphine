create_summary_table <- function(summary_stats) {
  formatted_stats <- summary_stats[, .(
    Year = year,
    `Q1 Range` = sprintf("%.1f%% - %.1f%%",
                         q1_min * 100, q1_max * 100),
    `Q2 Range` = sprintf("%.1f%% - %.1f%%", 
                         q2_min * 100, q2_max * 100),
    `Q3 Range` = sprintf("%.1f%% - %.1f%%", 
                         q3_min * 100, q3_max * 100),
    `Q4 Range` = sprintf("%.1f%% - %.1f%%", 
                         q4_min * 100, q4_max * 100),
    `Overall IQR` = sprintf("%.1f%% - %.1f%%", 
                            q1 * 100, q3 * 100)
  )]

  gt_table <- gt::gt(formatted_stats) |>
    gt::tab_header(
      title = "LAB Treatment Rates by Quartile"
    ) |>
    gt::fmt_percent(
      columns = c(`Q1 Range`, `Q2 Range`, `Q3 Range`, `Q4 Range`, `Overall IQR`),
      decimals = 1
   )
  
  return(gt_table)
}
