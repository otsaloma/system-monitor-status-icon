# -*- coding: utf-8-unix -*-
library(png)
SIZE = 16
read.blocks = function(x)
    with(lines <- strsplit(readLines(x), split=""),
         do.call(rbind, lapply(lines, as.integer)))

cblocks = read.blocks("blocks.cpu")
mblocks = read.blocks("blocks.memory")
dblocks = read.blocks("blocks.disk")
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
