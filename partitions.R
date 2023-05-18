library(grid)

set.seed(123456)
x <- runif(20)
y <- runif(20)
make_col <- function(x, y) {
  if (x < 0.3 && y > 0.8) return("seagreen")
  if (x < 0.3 && y > 0.5 && y < 0.8) return("steelblue")
  if (x > 0.3 && x < 0.7 && y > 0.5) return("coral")
  if (x > 0.7 && y > 0.5) return("steelblue")
  if (x > 0.7 && y < 0.5) return("seagreen")
  if (x > 0.2 && y < 0.3) return("coral")
  if (x < 0.2 && y < 0.5) return("steelblue")
  "steelblue"
}

col <- numeric(length(x))
for (i in seq_along(col)) col[i] <- make_col(x[i], y[i])

push_vp <- function(x) {
  vp <- viewport(x, width = 1/3 - 1/20, height = 2/3)
  pushViewport(vp)
  grid.clip()
}

draw_bg <- function() grid.rect(gp = gpar(fill = "antiquewhite", col = NA))
draw_points <- function() grid.points(x, y, pch = 20, size = unit(0.05, "npc"),
                                      default.units = "npc", gp = gpar(col = "grey60"))
line_gpar1 <- gpar(lwd = 7, col = "navajowhite3")
line_gpar2 <- gpar(lwd = 3, col = "navajowhite2")



grid.newpage()
push_vp(1/6)
draw_bg()
draw_points()
grid.rect(gp = gpar(lwd = 3, col = "navajowhite4", fill = NA))
grid.text("Entire data space", 0.5, 0.55, gp = gpar(col = "navajowhite4"))
popViewport()

push_vp(3/6)
draw_bg()
draw_points()
grid.curve(0.5, 0.5, 0.75, 1, curvature = 0.25, gp = line_gpar1)
grid.text("Bar 1", 0.3, 0.6, gp = gpar(col = "navajowhite4"))
grid.curve(0, 0.55, 0.5, 0.5, curvature = 0.05, gp = line_gpar1)
grid.text("Bar 2", 0.4, 0.25, gp = gpar(col = "navajowhite4"))
grid.curve(0.5, 0.5, 0.7, 0, curvature = -0.1, gp = line_gpar1)
grid.text("Bar 3", 0.8, 0.4, gp = gpar(col = "navajowhite4"))
grid.rect(gp = gpar(lwd = 2, col = "navajowhite4", fill = NA))
popViewport()

push_vp(5/6)
draw_bg()
grid.points(x, y, pch = 20, size = unit(0.05, "npc"),
            default.units = "npc", gp = gpar(col = col))

grid.curve(0, 0.8, 0.3, 0.9, curvature = 0.1, gp = line_gpar2)
grid.curve(0.3, 0.9, 0.4, 1, curvature = 0.05, gp = line_gpar2)
grid.curve(0.3, 0.9, 0.5, 0.5, curvature = 0.1, gp = line_gpar2)
grid.text("Bar 1\nGroup 1", 0.15, 0.95, gp = gpar(col = "seagreen", lineheight = 1))
grid.text("Bar 1 Group 2", 0.175, 0.6, gp = gpar(col = "steelblue"))
grid.text("Bar 1 Group 3", 0.5, 0.8, gp = gpar(col = "coral"))

grid.curve(0.5, 0.5, 1, 0.4, curvature = -0.1, gp = line_gpar2)
grid.text("Bar 3\nGroup 2", 0.85, 0.7, gp = gpar(col = "steelblue", lineheight = 1))
grid.text("Bar 3\nGroup 1", 0.85, 0.3, gp = gpar(col = "seagreen", lineheight = 1))

grid.curve(0.5, 0.5, 0.2, 0, curvature = 0.1, gp = line_gpar2)
grid.text("Bar 2\nGroup 2", 0.15, 0.35, gp = gpar(col = "steelblue", lineheight = 1))
grid.text("Bar 2 Group 3", 0.45, 0.25, gp = gpar(col = "coral", lineheight = 1))


grid.curve(0.5, 0.5, 0.75, 1, curvature = 0.25, gp = line_gpar1)
grid.curve(0, 0.55, 0.5, 0.5, curvature = 0.05, gp = line_gpar1)
grid.curve(0.5, 0.5, 0.7, 0, curvature = -0.1, gp = line_gpar1)


grid.rect(gp = gpar(lwd = 3, col = "navajowhite4", fill = NA))
popViewport()

