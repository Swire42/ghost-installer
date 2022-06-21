base: kernel grubmenu bazel pybind

kernel: packages
	sudo ./install-kernel.sh

packages:
	sudo ./install-packages.sh

grubmenu:
	sudo ./setup-grubmenu.sh

bazel: packages
	sudo ./install-bazel.sh

pybind: packages
	sudo pip3 install pybind11

.PHONY: base kernel packages grubmenu bazel pybind
