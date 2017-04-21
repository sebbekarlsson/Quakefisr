OFILES=Q_rsqrt.o

LIBFILES=libqrsqrt.so\
	 libqrsqrt.a

all: $(OFILES) $(LIBFILES)

Q_rsqrt.o: Q_rsqrt.cpp Q_rsqrt.h
	g++ -c Q_rsqrt.cpp
	
libqrsqrt.a: Q_rsqrt.o
	ar rcs $@ $^

libqrsqrt.so: Q_rsqrt.o
	ar rcs $@ $^

clean:
	-rm *.a
	-rm *.so
	-rm *.o

install:
	make
	cp ./Q_rsqrt.h /usr/local/include/.
	cp ./*.a /usr/local/lib/.
