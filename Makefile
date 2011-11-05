prefix = /usr/local

install:
	mkdir -p $(prefix)/icons/hicolor/16x16
	cp -v icons/*.png $(prefix)/share/icons/hicolor/16x16/apps
	cp -v system-monitor-status-icon $(prefix)/bin
