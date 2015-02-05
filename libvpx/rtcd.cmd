@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set SRC_PATH_BARE=C:\_my\dev\_github\libvpx

rem (SRC_PATH_BARE)/build/make/rtcd.pl --arch=x86 --sym=$(1) --config=$$(CONFIG_DIR)$$(target)$$(if $$(FAT_ARCHS),,-$$(TOOLCHAIN)).mk  $$(RTCD_OPTIONS) $$^ > $$@

rem perl %SRC_PATH_BARE%/vp8\common/rtcd_defs.pl
rem perl %SRC_PATH_BARE%/build/make/rtcd.pl --arch=x86 --sym vp8_rtcd --config=%SRC_PATH_BARE%/config.mk > vp8_rtcd_.h
perl %SRC_PATH_BARE%/build/make/rtcd.pl --arch=x86 --sym=vp8_rtcd --config=%SRC_PATH_BARE%/libs-x86-win32-vs12.mk --disable-avx --disable-avx2 %SRC_PATH_BARE%/vp8/common/rtcd_defs.pl > vp8_rtcd.h
perl %SRC_PATH_BARE%/build/make/rtcd.pl --arch=x86 --sym=vpx_scale_rtcd --config=%SRC_PATH_BARE%/libs-x86-win32-vs12.mk --disable-avx --disable-avx2 %SRC_PATH_BARE%/vpx_scale/vpx_scale_rtcd.pl > vpx_scale_rtcd.h

