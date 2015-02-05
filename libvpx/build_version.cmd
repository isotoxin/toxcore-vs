@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set BUILD_PFX=./
set SRC_PATH_BARE=C:\_my\dev\_github\libvpx

sh %SRC_PATH_BARE%/build/make/version.sh "%SRC_PATH_BARE%" %BUILD_PFX%vpx_version.h