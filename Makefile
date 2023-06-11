SRC=src/sk_capi.cpp
OBJ=$(patsubst %.cpp,%.o,$(SRC))
OUT=out/libcskia.a

CFLAGS=-I. -Ilib/skia -std=c++20

all: $(OUT)

$(OUT): $(OBJ)
	ar rcs out/libcskia.a $(OBJ)
	ranlib out/libcskia.a

%.o: %.cpp
	clang++ -c $< -o $@ $(CFLAGS)

clean:
	rm $(OUT) $(OBJ)
