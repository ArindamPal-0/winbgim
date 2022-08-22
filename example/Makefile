COMPILER=g++
CFLAGS=-Wall -g
COMPILE=$(COMPILE) $(CFLAGS)

.PHONY: all clean

all: main

main: main.o
	$(COMPILER) $< -o $@ -I includes -Llib -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32

main.o: main.cpp
	$(COMPILER) -c $< -o $@ -I includes

clean:
	del /Q main.exe *.o