DESTDIR ?=
PREFIX ?= /usr/local

SQL := sqlite3
DB := device_map.db

.SUFFIXES: .sql .db

.sql.db:
	$(SQL) $@ < $<

all: $(DB)

install: all
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 0755 embedded_device_map.py \
		$(DESTDIR)$(PREFIX)/bin/embedded_device_map
	install -d $(DESTDIR)$(PREFIX)/standalone/firmware
	install -m 0644 device_map.db \
		$(DESTDIR)$(PREFIX)/standalone/firmware/device_map.db

.PHONY: clean
clean:
	-rm -f $(DB)
