@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set SRC_PATH_BARE=C:\_my\dev\_github\libvpx\build\make

for /f %%i in ('"DIR "%SRC_PATH_BARE%" /A:-D /B"') do ( 
clean.cmd %SRC_PATH_BARE%\%%i
)
