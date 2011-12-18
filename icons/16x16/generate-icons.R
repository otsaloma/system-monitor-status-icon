library(png)
image = readPNG("system-monitor-status-icon.png")
blocks = as.data.frame(which(image[,,1] > 0, arr.ind=TRUE))
blocks$state = ifelse(blocks$row %in% 2:4, 4,
                      ifelse(blocks$row %in% 6:8, 3,
                             ifelse(blocks$row %in% 10:12, 2,
                                    ifelse(blocks$row %in% 14:16, 1,
                                           NA))))

blocks$cpu = blocks$col %in% 2:7
blocks$mem = blocks$col %in% 10:15
states = expand.grid(cpu_min=1:4, cpu_max=1:4, mem=1:4)
states = subset(states, cpu_min <= cpu_max)
ref = readPNG("system-monitor-status-icon.png")
for (i in 1:nrow(states)) {
    image[,,1:3] = 0
    cpu = (blocks$cpu &
           blocks$state >= states$cpu_min[i] &
           blocks$state <= states$cpu_max[i])

    if (any(cpu))
        image[blocks$row[cpu],blocks$col[cpu],] =
            ref[blocks$row[cpu],blocks$col[cpu],]

    mem = (blocks$mem & blocks$state <= states$mem[i])
    if (any(mem))
        image[blocks$row[mem],blocks$col[mem],] =
            ref[blocks$row[mem],blocks$col[mem],]

    writePNG(image, sprintf("system-monitor-status-icon-%d%d%d.png",
                            states$cpu_min[i],
                            states$cpu_max[i],
                            states$mem[i]))

}
