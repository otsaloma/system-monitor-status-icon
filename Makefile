# -*- coding: us-ascii-unix -*-

DESTDIR =
PREFIX  = /usr/local
BINDIR  = $(DESTDIR)$(PREFIX)/bin

ICON_SIZE   = 24
ICON_SOURCE = icons/$(ICON_SIZE)x$(ICON_SIZE)
ICON_TARGET = $(DESTDIR)$(PREFIX)/share/icons/hicolor/$(ICON_SIZE)x$(ICON_SIZE)/apps

install:
	mkdir -p $(BINDIR)
	cp system-monitor-status-icon $(BINDIR)
	chmod +x $(BINDIR)/system-monitor-status-icon
	mkdir -p $(ICON_TARGET)
	cp $(ICON_SOURCE)/system-monitor-status-icon*.png $(ICON_TARGET)

.PHONY: install
