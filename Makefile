CXX = g++
CXXFLAGS = -fPIC -O2 -Wall -std=c++17
LDFLAGS = -shared

all: libcoords.so test

libcoords.so: coords.o
	$(CXX) $(LDFLAGS) -o $@ $^

coords.o: coords.cpp coords.h
	$(CXX) $(CXXFLAGS) -c coords.cpp

test: test.cpp libcoords.so coords.h
	$(CXX) -std=c++17 -L. -Wl,-rpath=. -o $@ test.cpp -lcoords

clean:
	rm -f *.o *.so test *.txt
