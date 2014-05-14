VERSION:=9.13
EXTRACT_DIR:=libav-$(VERSION)
SOURCE_TARBALL:=$(EXTRACT_DIR).tar.gz
SOURCE_URL:=https://libav.org/releases/$(SOURCE_TARBALL)

all: apt get-src build

apt:
	apt-get update -qq
	apt-get install -y curl
	apt-get build-dep -y libav-tools

get-src:
	curl -O $(SOURCE_URL)
	tar -xvzf $(SOURCE_TARBALL)

build:
	cd $(EXTRACT_DIR) && sh configure
	cd $(EXTRACT_DIR) && $(MAKE)

install:
	cd $(EXTRACT_DIR) && $(MAKE) install
