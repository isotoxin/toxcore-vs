@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set BUILD_PFX=./
set SRC_PATH_BARE=C:\_my\dev\_github\libvpx

sh %SRC_PATH_BARE%/build/make/gen_msvs_vcxproj.sh --lib --target=x86 --out=out.vcxproj --name=libvpx --ver=12 --src-path-bare="%SRC_PATH_BARE%"