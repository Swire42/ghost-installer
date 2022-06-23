base: kernel grubmenu bazel

plus: pybind vim

kernel: packages
	./install-kernel.sh

packages:
	./install-packages.sh

grubmenu:
	./setup-grubmenu.sh

bazel: packages
	./install-bazel.sh

pybind:
	apt install python3-pip
	pip3 install pybind11

vim:
	apt install vim

.PHONY: base plus kernel packages grubmenu bazel pybind vim
