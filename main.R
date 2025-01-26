
# Load data
main_df <- load_main_data()

sir_df  <- load_sir_data()

# Merge data
final_df <-
  create_final_df(sir_df, main_df)

validate_merges(sir_df, main_df, final_df) #TODO

## National data

national_df <-
  calculate_lab_rate(dt = final_df, groups = "year")

validate_aggregation(final_df, national_df) #TODO

validate_rate() #TODO

national_summary <-
  calculate_summary_stats(dt = national_df)

plot_lab_count() #TODO

plot_lab_rate() #TODO

create_summary_table() #TODO

## UTLA data

utla_df <-
  calculate_lab_rate(dt = final_df, groups = c("year", "utla23nm"))

utla_summary <-
  calculate_summary_stats(dt = utla_df)

plot_lab_count() #TODO

plot_lab_rate() #TODO

create_summary_table() #TODO

## Tranche data
# I don't have the tranche data on this laptop so this is commenteed out for now
tranche_df <- calculate_lab_rate(dt = final_df, groups = c("year", "tranche"))

tranche_summary <- calculate_summary_stats(dt = tranche_df)

plot_lab_count()

plot_lab_rate()

create_summary_table()
