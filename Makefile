OPTS = -Wall -W -O3 

SRC = src
BUILD = build
PREFIX = /usr/local
INSTALLDIR = $(PREFIX)/bin

$(shell mkdir -p $(BUILD))

default: ntripclient

ntripclient: $(SRC)/ntripclient.c $(SRC)/serial.c
	$(CC) $(OPTS) $(SRC)/ntripclient.c -o $(BUILD)/$@ $(LIBS)

install:
	install -m755 $(BUILD)/ntripclient $(DESTDIR)$(INSTALLDIR)/

uninstall:
	rm -f $(DESTDIR)$(INSTALLDIR)/ntripclient

zip: Makefile Makefile.win README $(SRC)/ntripclient.c $(SRC)/serial.c
	zip -9r $(BUILD)/ntripclient.zip Makefile Makefile.win README $(SRC)

tgz: Makefile Makefile.win README $(SRC)/ntripclient.c $(SRC)/serial.c
	tar -cvfz $(BUILD)/ntripclient.tgz Makefile Makefile.win README $(SRC)

clean:
	-rm -rf $(BUILD)
