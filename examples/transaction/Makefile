HIKEC = go run ../../../cmd/hikec
TARGET = windows
OUTPUT = sqlite-transaction.exe

.PHONY: all build run clean MakeClean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
CLEAN_COMMAND = del /q main.ll $(OUTPUT) sqlite-transaction.db sqlite3.dll >nul 2>nul
RUN_COMMAND = .\$(OUTPUT)
else
CLEAN_COMMAND = rm -f main.ll $(OUTPUT) sqlite-transaction.db sqlite3.dll *.dll
RUN_COMMAND = ./$(OUTPUT)
endif

all: build

build: $(OUTPUT)

$(OUTPUT): main.hike hike.mod ../../hike.mod
	$(HIKEC) build -target $(TARGET) main.hike -o $(OUTPUT)

run: build
	$(RUN_COMMAND)

MakeClean:
	-$(CLEAN_COMMAND)

clean: MakeClean
