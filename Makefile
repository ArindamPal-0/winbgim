# make the combined static library
libbgi.a: drawing.o misc.o mouse.o palette.o text.o winbgi.o winthread.o file.o dibutil.o winbgim.h graphics.h
	ar -rv build/libbgi.a drawing.o misc.o mouse.o palette.o text.o winthread.o winbgi.o file.o dibutil.o

# make the build directory
build:
	mkdir build

# clean the working directory, deleting temp object files and build files
clean:
	- del /Q *.o
	- del /Q build\*

CPPFLAGS = -c -O3 -fno-rtti -fno-exceptions

# Building the object files

drawing.o: drawing.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) drawing.cxx

misc.o: misc.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) misc.cxx

mouse.o: mouse.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) mouse.cxx

palette.o: palette.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) palette.cxx

text.o: text.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) text.cxx

winbgi.o: winbgi.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) winbgi.cxx

winthread.o: winthread.cxx winbgim.h winbgitypes.h
	g++ $(CPPFLAGS) winthread.cxx

dibutil.o: dibutil.cxx dibutil.h dibapi.h
	g++ $(CPPFLAGS) dibutil.cxx

file.o: file.cxx dibutil.h dibapi.h winbgitypes.h
	g++ $(CPPFLAGS) -c file.cxx

# making graphics.h, its just changed name for winbgim.h
graphics.h: winbgim.h build
	- del build\graphics.h
	copy winbgim.h build\graphics.h

bgi.exe: bgi.cxx
	g++ bgi.cxx -o bgi.exe

