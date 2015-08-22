#pragma once

#include <WinSock2.h>
// support visual studio 2013 compile

#define _INC_ERRNO

typedef int ssize_t;

//#define snprintf _snprintf

#define DYNAMIC( eltype, arrname, arrsize ) size_t sizeof_##arrname = sizeof(eltype) * (arrsize); eltype * arrname = _alloca( sizeof_##arrname )
#define sizeOf( dynarrname ) sizeof_##dynarrname
