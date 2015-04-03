clean:
	mv build/readme.md readme.tmp.md
	rm -rf build
	mkdir build
	mv readme.tmp.md build/readme.md
