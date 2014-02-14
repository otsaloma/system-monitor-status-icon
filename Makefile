# -*- coding: us-ascii-unix -*-

DESTDIR =
PREFIX  = /usr/local
bindir  = $(DESTDIR)$(PREFIX)/bin

ICON_SIZE   = 24
icon_source = icons/$(ICON_SIZE)x$(ICON_SIZE)
icon_target = $(DESTDIR)$(PREFIX)/share/icons/hicolor/$(ICON_SIZE)x$(ICON_SIZE)/apps

install:
	mkdir -p $(icon_target)
	cp system-monitor-status-icon $(bindir)
	cp $(icon_source)/system-monitor-status-icon*.png $(icon_target)
