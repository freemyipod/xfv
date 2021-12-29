# Makefile for efidecomp

efidecomp: efidecomp.c efihack.h Decompress.c
	gcc -o efidecomp efidecomp.c Decompress.c
