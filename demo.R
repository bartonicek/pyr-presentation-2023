
library(plotscaper)

# layout1 <- matrix(c(1, 1, 2,
#                     1, 1, 3, 
#                     4, 4, 5), nrow = 3, byrow = TRUE)
# 
# ps_scene(mtcars, layout = layout1) |>
#   ps_scatter(ps_map("wt", "mpg")) |>
#   ps_square(ps_map("gear", "am")) |>
#   ps_bar(ps_map("cyl")) |>
#   ps_histo(ps_map("disp")) |>
#   ps_bubble(ps_map("carb", "vs"))

# diamonds <- ggplot2::diamonds
# layout3 <- matrix(c(1, 1, 
#                     2, 3), ncol = 2, byrow = TRUE)
# data3 <- diamonds[sample(nrow(diamonds), 1e4, replace = FALSE), ]
# 
# ps_scene(data3, layout = layout3) |>
#   ps_scatter(ps_map("carat", "price")) |>
#   ps_histo(ps_map("depth")) |>
#   ps_square(ps_map("color", "clarity"))

