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

