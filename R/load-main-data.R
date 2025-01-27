load_main_data  <- function() { 
  main_df <-
    data.table::fread("data/K3anon_FullDataset_for_VfM.csv")

  main_df <-
    main_df[drug_grp == "Opiate", .(client_random_id, n_jy, utla23cd)]

  return(main_df)
}
