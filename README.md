# dp1

Mark Ogden restored the source code of the P1.COM syntax and semantic analysis program in C from the HiTech C v3.09 compiler for CP/M.

Program p1x3 is still a work in progress but that it has been partially tested and appears to work. 

This is the last of the important HiTech C v3.09 compiler programs without which it is impossible to create a cross compiler for modern operating systems or a unix-like UZI180.

Mark Ogden intends to continue work on improving the source code of this program. All changes will be made to the published source code as they become available.

To compile the first pass program p1x3 with gcc need to run the command

        gcc -O2 -op1x3 cclass.c emit.c expr.c lex.c main.c op.c program.c stmt.c sym.c type.c memchk.c

To create the p1x.com executable for CP/M, just run:

        gmake

Source code posted with permission from Mark Ogden.


Andrey Nikitin 20-08-2022

In the program made small but important changes.

 Andrey Nikitin 25-08-2022
