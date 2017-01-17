#pragma once

#define DHT_HARDENING 1

#ifdef _WIN32

#include <WinSock2.h>
// support visual studio 2013 compile

#define _INC_ERRNO

typedef int ssize_t;

#if _MSC_VER <= 1800
#define snprintf _snprintf
#define __func__ __FUNCTION__
#endif

#define __attribute__(x)

#define DYNAMIC( eltype, arrname, arrsize ) size_t sizeof_##arrname = sizeof(eltype) * (arrsize); eltype * arrname = _alloca( sizeof_##arrname )
#define sizeOf( dynarrname ) sizeof_##dynarrname

#endif

#ifdef _NIX

#define DYNAMIC( eltype, arrname, arrsize ) eltype arrname[arrsize]
#define sizeOf( dynarrname ) sizeof(dynarrname)

#endif