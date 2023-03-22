.SUFFIXES: .py .v

%.v: %.py
	python $<

all: tests hdl

clean:
	rm *.vcd?*
	rm *.pyc
	rm *.v
	rm *.vhd

tests:
	python -m pytest
	echo "pytest module has now replaced nosetests"
	echo "  was : nosetests --with-isolation"
	echo "  now : python -m pytest"

hdl: tests register.v mux2.v mem.v

