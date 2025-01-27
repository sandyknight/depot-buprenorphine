calculate_summary_stats <- function(dt, rate_col = "lab_rate", by_col = "year") {
  get_quartile_range <- function(x, lower_q, upper_q = NULL) {
    if (is.null(upper_q)) {
      bounds <- x > quantile(x, lower_q)
    } else {
      bounds <- x > quantile(x, lower_q) & x <= quantile(x, upper_q)
    }
    c(min = min(x[bounds]), max = max(x[bounds]))
  }
 
  dt[, {
    quartiles <- quantile(get(rate_col), c(0.25, 0.5, 0.75))
   
    # Create the summary list
    list(
      mean = mean(get(rate_col)),
      IQR = IQR(get(rate_col)),
      min = min(get(rate_col)),
      q1 = quartiles[1],
      median = quartiles[2],
      q3 = quartiles[3],
      max = max(get(rate_col)),
     
     # Calculate ranges for each quartile
      setNames(
	c(get_quartile_range(get(rate_col), 0, 0.25),      # Q1
	  get_quartile_range(get(rate_col), 0.25, 0.5),    # Q2
	  get_quartile_range(get(rate_col), 0.5, 0.75),    # Q3
	  get_quartile_range(get(rate_col), 0.75)),        # Q4
	c("q1_min", "q1_max", "q2_min", "q2_max", 
	  "q3_min", "q3_max", "q4_min", "q4_max")
      )
    )
  }, by = by_col]
}

