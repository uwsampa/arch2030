# targets that aren't filenames
.PHONY: all clean deploy

CSEHOST := bicycle.cs.washington.edu
CSEPATH := /cse/www2/sampa/arch2030.cs

RSYNCARGS := --compress --recursive --checksum --itemize-changes --perms --chmod=ug+rw

build:
	jekyll build --config _config.yml

deploy: clean build
	rsync $(RSYNCARGS) _site/ $(CSEHOST):$(CSEPATH)
