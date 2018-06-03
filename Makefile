.PHONY: install uninstall

install:
	cp -r themes/arc-dark /usr/share/awesome/themes/

uninstall:
	rm -r /usr/share/awesome/themes/arc-dark
