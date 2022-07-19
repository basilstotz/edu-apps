
PATCH:="./patch"


script:
	@./bin/make-chroot-script $(PATCH) > chroot-script.sh
