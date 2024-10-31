CC=g++
TARGET=roll
FLAGS= -g -Werror -Wall -Iinclude/

INSTALLDIR=/usr/local/bin
SRC=./src
CPPFILES=$(wildcard $(SRC)/*.cpp)
OBJS=$(patsubst %.cpp, %.o, $(CPPFILES))

.PHONY: all install uninstall clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ -o $@

%.o: %.cpp
	$(CC) $(FLAGS) -c $< -o $@

install: $(TARGET)
	install -m 755 $(TARGET) $(INSTALLDIR)

uninstall:
	rm -f $(INSTALLDIR)/$(TARGET)

clean:
	rm -f src/*.o roll

