VERSION:=11
SOURCE:=libav-$(VERSION)
TARBALL:=$(SOURCE).tar.gz
SOURCE_URL:=https://libav.org/releases/$(TARBALL)

all: $(SOURCE) build

$(SOURCE): $(TARBALL)
	tar -xvzf $(TARBALL)

$(TARBALL):
	curl -SLo $(TARBALL) $(SOURCE_URL)

build:
	cd $(SOURCE) && sh configure
	cd $(SOURCE) && $(MAKE)

install:
	cd $(SOURCE) && $(MAKE) install
