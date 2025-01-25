openxlsx::getSheetNames("data/RAND-data-dictionary.xlsx")

dd_main <- openxlsx::read.xlsx(xlsxFile = "data/RAND-data-dictionary.xlsx",
                    sheet = "Main table - journeys",
                    cols = c(1, 3:6)) |>
  janitor::clean_names()


dd_sir <- openxlsx::read.xlsx(xlsxFile = "data/RAND-data-dictionary.xlsx",
                              sheet = "SIR table",
                              cols = c(1:5)) |>
  janitor::clean_names()




dd_top <- openxlsx::read.xlsx(xlsxFile = "data/RAND-data-dictionary.xlsx",
                    sheet = "TOP table",
                    cols = c(1:5))

colnames(dd_main)


df <-
  data.table::fread("data/K3anon_FullDataset_for_VfM.csv")

agent <-
  pointblank::create_agent(tbl = df) |>
  pointblank::col_vals_not_null(dplyr::everything()) |>
  pointblank::rows_distinct() |>
  pointblank::rows_complete() |>
  pointblank::interrogate()

pointblank::get_agent_report(agent)


# Print short summary
print(short_summary)
