prefix = /usr/local

install:
	mkdir -p $(prefix)/icons/hicolor/16x16/apps
	mkdir -p $(prefix)/icons/hicolor/24x24/apps
	cp -v icons/16x16/*.png $(prefix)/share/icons/hicolor/16x16/apps
	cp -v icons/24x24/*.png $(prefix)/share/icons/hicolor/24x24/apps
	cp -v system-monitor-status-icon $(prefix)/bin
