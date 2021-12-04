cmake_minimum_required(VERSION 3.10)
project(hello CXX)

add_library(hello SHARED hello/hello.cpp)
