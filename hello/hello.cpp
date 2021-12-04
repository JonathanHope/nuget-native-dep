#include <stdio.h>

extern "C"
{
  void HelloWorld(char* buffer, size_t bufferSize)
  {
    snprintf(buffer, bufferSize, "Hello World!");
  }
}
