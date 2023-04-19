library(knitr)
library(dplyr)
library(purrr)
library(ggplot2)
library(devtools)
load_all(".")
knitr::opts_chunk$set(echo = TRUE)

# This code below is what's needed to process our dataset
# the beaver datasets are builtin the R programming language
# you do not need to do anything to use the dataset,
# but we will be processing them

bev1 <- beaver1 |>
  dplyr::mutate(
    bev_num = 1,
    hours = time %/% 100 + 24*(day - day[1]) + (time %% 100)/60
  )

bev2 <- beaver2 |>
  dplyr::mutate(
    bev_num = 2,
    hours = time %/% 100 + 24*(day - day[1]) + (time %% 100)/60
  )

bevs <- dplyr::bind_rows(bev1, bev2) |>
  dplyr::mutate(
    activ_char = purrr::map_chr(activ, recode_activ)
  )

# this table calculation should be loaded in the final report
bev_num_counts <- bevs |>
  dplyr::count(bev_num) |>
  write.table();

# this table should be displayed in the report
bev_num_counts |>
  knitr::kable()



# there is a table calculation here that ends up being displayed in the final report
activ_char_counts <- bevs |>
  dplyr::count(bev_num, activ_char)


activ_char_counts |>
  knitr::kable()
