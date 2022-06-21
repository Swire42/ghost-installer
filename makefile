base: kernel grubmenu

kernel: packages
	sudo ./install-kernel.sh

packages:
	sudo ./install-packages.sh

grubmenu:
	sudo setup-grubmenu.sh
