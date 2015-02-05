#pragma once

#include <WinSock2.h>
// support visual studio 2013 compile

#define _INC_ERRNO

typedef int ssize_t;

#define snprintf _snprintf