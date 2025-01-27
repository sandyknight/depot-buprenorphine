validate_aggregation <- function(final_df, aggregated_df) {
  # Total LAB treatments should match before and after aggregation
  total_lab_pre <- final_df[, sum(phbudi_any)]
  total_lab_post <- aggregated_df[, sum(phbudi_any)]
  
  assertthat::assert_that(
    abs(total_lab_pre - total_lab_post) < 1e-10,
    msg = "LAB totals don't match after aggregation"
  )
  
  # Total people receiving any treatment should match
  total_people_pre <- final_df[, .N]
  total_people_post <- aggregated_df[, sum(phbudi_any + other_ost)]
  
  assertthat::assert_that(
    abs(total_people_pre - total_people_post) < 1e-10,
    msg = "Totals don't match after aggregation"
  )
}
