@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION





sh egrep "#define [A-Z0-9_]+ [01]" vpx_config.h | gawk '{print $2 " equ " $3}' > vpx_config.asm
