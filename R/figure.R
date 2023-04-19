library(tidyverse)
library(devtools)
load_all(".")
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

g <-  ggplot(bevs) +
  geom_line(aes(x = hours, y = temp)) +
  geom_point(
    data = dplyr::filter(bevs, activ == 1),
    aes(x = hours, y = temp),
    color = "red"
  ) +
  geom_hline(yintercept = 37.5, color = "grey") +
  facet_grid(~bev_num) +
  ggtitle("Beaver Body Temperatures") +
  theme_minimal();

ggsave("figure_1.png", plot = g, device = "png",
       path = "analysis/output", width = 8, height = 5)

