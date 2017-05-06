#!/usr/bin/env bash

make clean
make
st-flash erase
st-flash --reset write ./*.bin 0x8000000

