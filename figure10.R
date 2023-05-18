library(grid)

set.seed(1234)
x <- runif(20)
y <- runif(20)

col1 <- ifelse((x + y) < 1, "coral3", "dodgerblue3")
col2 <- numeric(20)

cols22 <- c("coral1", "coral4", "dodgerblue1", "dodgerblue4")

col2[(y >= 1 - x) & (y >= x)] <- cols22[3]
col2[(y >= 1 - x) & (y < x)] <- cols22[4]
col2[(y < 1 - x) & (y >= x)] <- cols22[2]
col2[(y < 1 - x) & (y < x)] <- cols22[1]


push_vp <- function(x) {
  vp <- viewport(x, width = 1/3 - 1/20, height = 2/3)
  pushViewport(vp)
  grid.clip()
}

draw_points <- function(col) grid.points(x, y, pch = 20, size = unit(0.05, "npc"),
                                      default.units = "npc", 
                                      gp = gpar(col = col))

png("figure10.png", width = 6, height = 3, units = "in", res = 300)

grid.newpage()
push_vp(1/6)
draw_points("grey80")
grid.rect(gp = gpar(lwd = 3, fill = NA, col = "grey40"))
grid.text("Entire data space")
popViewport()

push_vp(1/2)
draw_points(col1)
grid.rect(gp = gpar(lwd = 3, fill = NA, col = "grey40"))
grid.abline(slope = -1, intercept = 1, 
            gp = gpar(col = "grey40", lty = "dashed"))
grid.text("Bar 1", 0.4, 0.4, gp = gpar(col = "coral3"))
grid.text("Bar 2", 0.6, 0.6, gp = gpar(col = "dodgerblue3"))
popViewport()

push_vp(5/6)
grid.rect(gp = gpar(lwd = 3, fill = NA, col = "grey40"))
grid.abline(slope = -1, intercept = 1, 
            gp = gpar(col = "grey40", lty = "dashed"))
grid.lines(c(0, 0.5), c(0, 0.5), gp = gpar(col = "grey40", lty = "dashed"))
grid.lines(c(0.5, 1), c(0.5, 1), gp = gpar(col = "grey40", lty = "dashed"))
draw_points(col2)

grid.text("Bar 1\nGroup 1", 0.25, 0.5, gp = gpar(col = cols22[2]))
grid.text("Bar 1\nGroup 2", 0.5, 0.25, gp = gpar(col = cols22[1]))
grid.text("Bar 2\nGroup 2", 0.75, 0.5, gp = gpar(col = cols22[4]))
grid.text("Bar 2\nGroup 1", 0.5, 0.75, gp = gpar(col = cols22[3]))

dev.off()