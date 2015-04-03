# Usually should happen on remote
PHONY += all clean flash attach update

all:
	flash
	update
	attach

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

update_full:
	./local_scripts/update_full.sh

reboot:
	./local_scripts/reboot.sh
