SRC=src/sk_c_api.cc
OBJ=$(patsubst %.cc,%.o,$(SRC))
OUT=out/libcskia.so

CFLAGS=-I. -Ilib/skia -std=c++20

all: $(OUT)

$(OUT): $(OBJ)
	@mkdir out
	clang++ -shared -o $(OUT) $(OBJ)

%.o: %.cc
	clang++ -fpic -c $< -o $@ $(CFLAGS)

clean:
	rm $(OUT) $(OBJ)
	rmdir out
