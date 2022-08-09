
PATCH:="./patch"


script:
	@./bin/make-chroot-script $(PATCH) > install-patch-script.sh
	@chmod +x install-patch-script.sh
