TARGET ?= /usr/local/bin

FILE ?= clone

install:
	@mkdir -p $(TARGET)
	echo "installing Clone........."
	sudo cp -f clone.sh $(TARGET)/$(FILE)
	sudo chmod 775 $(TARGET)/$(FILE)

uninstall:
	echo "uninstalling Clone ....."
	rm -f $(TARGET)/clone

.PHONY: install uninstall