PR := test.exe

CPPFLAGS:=-std=c++11
LDFLAGS:=-std=c++11
LDINCLUDES:=.
INCLUDES:=.

HEADERS := $(wildcard *.h)

SRC := $(wildcard *.cpp)
OBJ := $(notdir $(SRC:.cpp=.o))


# ------------------------

all: $(PR)

$(PR): $(OBJ)
	g++ -g $^ -o $@ $(LDFLAGS) -L $(LDINCLUDES)

%.o: %.cpp $(HEADERS)
	g++ -o $@ $(CPPFLAGS) -I $(INCLUDES) -c $<

clean:
	del /Q /S *.o *.exe
