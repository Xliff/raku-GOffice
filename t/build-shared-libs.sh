gcc 00-struct-sizes.c -Wno-deprecated-declarations `pkg-config --cflags libgoffice-0.10` -fPIC --shared -o 00-struct-sizes.so `pkg-config --libs libgoffice-0.10`
