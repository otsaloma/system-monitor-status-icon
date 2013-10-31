# -*- coding: us-ascii-unix -*-
prefix = /usr/local

install:
	mkdir -p $(prefix)/icons/hicolor/24x24/apps
	cp -v icons/24x24/*.png $(prefix)/share/icons/hicolor/24x24/apps
	cp -v system-monitor-status-icon $(prefix)/bin

uninstall:
	rm -fv $(prefix)/share/icons/hicolor/24x24/apps/system-monitor-status-icon*.png
	rm -fv $(prefix)/bin/system-monitor-status-icon
