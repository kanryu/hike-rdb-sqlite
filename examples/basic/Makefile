HIKEC = go run ../../../cmd/hikec
TARGET = windows
OUTPUT = sqlite-crud.exe

.PHONY: all emit-ir build run clean MakeClean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
CLEAN_COMMAND = del /q main.ll $(OUTPUT) sqlite-crud.db sqlite-crud.db-wal sqlite-crud.db-shm sqlite3.dll >nul 2>nul
RUN_COMMAND = .\$(OUTPUT)
else
CLEAN_COMMAND = rm -f main.ll $(OUTPUT) sqlite-crud.db sqlite-crud.db-wal sqlite-crud.db-shm sqlite3.dll *.dll
RUN_COMMAND = ./$(OUTPUT)
endif

all: build

emit-ir:
	$(HIKEC) emit-ir -target $(TARGET) -o main.ll main.hike

build: $(OUTPUT)

$(OUTPUT): main.hike hike.mod ../../hike.mod
	$(HIKEC) build -target $(TARGET) main.hike -o $(OUTPUT)

run: build
	$(RUN_COMMAND)

MakeClean:
	-$(CLEAN_COMMAND)

clean: MakeClean
