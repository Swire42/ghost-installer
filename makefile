base: kernel grubmenu bazel

kernel: packages
	sudo ./install-kernel.sh

packages:
	sudo ./install-packages.sh

grubmenu:
	sudo ./setup-grubmenu.sh

bazel: packages
	sudo ./instal-bazel.sh

.PHONY: base kernel packages grubmenu bazel
