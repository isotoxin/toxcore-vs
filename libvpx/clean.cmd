@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set SRC_PATH_BARE=C:\_my\dev\_github\libvpx

tr -d "\r" < %1 > %1_
del %1
ren %1_ %~nx1
