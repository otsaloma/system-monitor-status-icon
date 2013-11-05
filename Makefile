# -*- coding: us-ascii-unix -*-

prefix = /usr/local
icon_size = 24

icon_source = icons/$(icon_size)x$(icon_size)
icon_target = $(prefix)/share/icons/hicolor/$(icon_size)x$(icon_size)/apps

install:
	mkdir -pv $(icon_target)
	cp -v $(icon_source)/system-monitor-status-icon*.png $(icon_target)
	cp -v system-monitor-status-icon $(prefix)/bin

uninstall:
	rm -fv $(icon_target)/system-monitor-status-icon*.png
	rm -fv $(prefix)/bin/system-monitor-status-icon
