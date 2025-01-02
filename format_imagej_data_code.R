#' Script for ingesting lobster data and returning pivoted data for Excel sheet
#' 
#' Written by Arianna Krinos, 31 July 2024
#install.packages("pacman")
library(pacman)
pacman::p_load(dplyr,tidyr)

setwd("") # set working directory to wherever your ImageJ data .csv file is saved

lobster_data=read.csv(".csv") %>% # make sure to put the correct file name for your data
  dplyr::mutate(RGB=(256^2*Red)+(256*Green)+Blue) %>% # code to make RGB column for each ROI, can be removed
  tidyr::pivot_longer(cols=c(Red,Green,Blue,RGB),names_to="column",
                      values_to="number") %>%
  dplyr::mutate(column=case_when(column!="RGB"~paste0(Region,"_",substring(column, 1, 1)),
                                 TRUE~paste0(Region,"_",column)))

select_cols = c("Date","Lobster","number","column") # for my dataset, Date and Lobster are the 2 main columns for my data organization

lobster_data_pivot = lobster_data %>% dplyr::select(select_cols) %>%
  pivot_wider(id_cols=c("Date","Lobster"),names_from="column", # make sure to change if you select 2 other columns above
              values_from="number")

write.csv(lobster_data_pivot,".csv") # rename file and make sure it's different from the original .csv file, this will save the new data in a .csv file
