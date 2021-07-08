.PHONY = all clean run

CC = g++
CFLAGS = -Wall -g
SRC := $(wildcard src/*.cpp)
OBJ := $(patsubst src/%.cpp, bin/linux/obj/%.o, ${SRC})
LIBS = -lm -lglfw -lGL -lGLEW

borrasca: ${OBJ}
	${CC} ${CFLAGS} ${LIBS} ${OBJ} -o bin/linux/borrasca

bin/linux/obj/%.o: src/%.cpp
	${CC} ${CFLAGS} -c -o $@ $<

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${OBJ}

run:
	./bin/linux/borrasca
