load_sir_data  <- function() { 

  sir_df <-
    data.table::fread("data/SIR_table_for_VfM_linked.csv")

  sir_df <- sir_df[, .(client_random_id, n_jy, submoddt, phbudi_any)]

  return(sir_df)

}
