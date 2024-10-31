CC=g++
TARGET=roll
FLAGS= -g -Werror -Wall -Iinclude/

SRC=./src
CPPFILES=$(wildcard $(SRC)/*.cpp)
OBJS=$(patsubst %.cpp, %.o, $(CPPFILES))

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ -o $@

%.o: %.cpp
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -f roll

