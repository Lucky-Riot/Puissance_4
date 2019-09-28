CC = gcc
CFLAGS = -W -Wall
LDFLAGS =
DEBUG = no
EXEC = Puissance4


SRC = $(wildcard ./src/*.c)
OBJ = $(patsubst ./src/%.c, ./obj/%.o, $(SRC))

$(EXEC) : fonction.o main.o
	$(CC) -o $(EXEC) ./obj/fonction.o ./obj/main.o $(LDFLAGS)

fonction.o : ./src/fonction.c
	$(CC) -o ./obj/fonction.o -c ./src/fonction.c $(CFLAGS)

main.o : ./src/main.c ./include/fonction.h
	$(CC) -o ./obj/main.o -c ./src/main.c $(CFLAGS)

.PHONY : clean mrproper

clean:
	@rm -f ./obj/*.o

mrproper: clean
	@rm -f $(EXEC)
