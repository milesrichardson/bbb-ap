# Usually should happen on remote
PHONY += all clean flash

all:
	flash

clean:
	mv build/readme.md readme.tmp.md
	rm -rf build
	mkdir build
	mv readme.tmp.md build/readme.md

flash:
	./local_scripts/flash.sh

attach:
	./local_scripts/attach.sh

update:
	./local_scripts/update.sh
