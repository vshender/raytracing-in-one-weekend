.PHONY: all build render clean

all: build

build: _build/default/bin/raytracer.exe

_build/default/bin/raytracer.exe: bin/*.ml
	dune build

render:
	dune exec ./bin/raytracer.exe > scene.ppm

clean:
	dune clean
	for dir in . bin lib test; do \
	  rm -f $$dir/*~ $$dir/\#*; \
	done
	rm -f scene.ppm
