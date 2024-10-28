all:
	rm -f ./bin/*.*
	dasm *.asm -f3 -v0 -ocart.bin -lcart.lst -scart.sym
	mv cart.bin cart.lst cart.sym ./bin


run:
	open -a Stella ./bin/cart.bin