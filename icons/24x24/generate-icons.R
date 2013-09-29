# -*- coding: utf-8-unix -*-
library(png)
SIZE = 24
colors = readPNG("system-monitor-status-icon.png")
cblocks = matrix(NA, SIZE, SIZE)
mblocks = matrix(NA, SIZE, SIZE)
dblocks = matrix(NA, SIZE, SIZE)
clines = readLines("blocks.cpu")
mlines = readLines("blocks.memory")
dlines = readLines("blocks.disk")
for (i in 1:SIZE) {
    for (j in 1:SIZE) {
        cblocks[i,j] = as.integer(substr(clines[i], j, j))
        mblocks[i,j] = as.integer(substr(mlines[i], j, j))
        dblocks[i,j] = as.integer(substr(dlines[i], j, j))
    }
}
states = expand.grid(cpu_min=1:4, cpu_max=1:4, memory=1:4, disk=1:4)
states = subset(states, cpu_min <= cpu_max)
states$fname = sprintf("system-monitor-status-icon-%d%d%d%d.png",
                       states$cpu_min,
                       states$cpu_max,
                       states$memory,
                       states$disk)

for (i in 1:nrow(states)) {
    image = colors
    image[,,1:4] = 0
    m = (cblocks %in% states$cpu_min[i]:states$cpu_max[i] |
         mblocks %in% 1:states$memory[i] |
         dblocks %in% 1:states$disk[i])

    image[m] = colors[m]
    writePNG(image, states$fname[i])
}
