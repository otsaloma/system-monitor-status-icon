# -*- coding: utf-8-unix -*-
library(png)
cblocks = as.matrix(read.table("blocks.cpu"))
mblocks = as.matrix(read.table("blocks.memory"))
dblocks = as.matrix(read.table("blocks.disk"))
states = expand.grid(cpu_min=1:4, cpu_max=1:4, memory=1:4, disk=1:4)
states$fname = sprintf("system-monitor-status-icon-%d%d%d%d.png",
                       states$cpu_min,
                       states$cpu_max,
                       states$memory,
                       states$disk)

states = subset(states, cpu_min <= cpu_max)
full = readPNG("system-monitor-status-icon.png")
blank = readPNG("background.png")
for (i in 1:nrow(states)) {
    image = blank
    m = with(states[i,],
             cblocks %in% cpu_min:cpu_max |
             mblocks %in% 1:memory |
             dblocks %in% 1:disk)

    image[m] = full[m]
    writePNG(image, states$fname[i])
}
