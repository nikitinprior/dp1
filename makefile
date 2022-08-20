########################################################################
#
#  Use this Makefile to build the P1.COM for HiTech C v3.09 under Linux
#  or Windows using John Elliott's zxcc emulator.
#
########################################################################
TARGET = p1.cpm
CSRCS = cclass.c emit.c expr.c lex.c main.c op.c program.c stmt.c sym.c type.c

HDRS  = cclass.h p1.h

OBJS = $(CSRCS:.c=.obj) 


CFLAGS=-O -dOLDLIB
LIBS=LIBCORIG.LIB
CRT=CRTORIG.OBJ 
#CFLAGS=-O
#LIBS=LIBC.LIB
#CRT=CRTCPM.OBJ 

ifeq ($(OS),Windows_NT)
RM = del /q
else
RM = rm -f
endif

all:	$(TARGET)

.SUFFIXES:		# delete the default suffixes
.SUFFIXES: .c .obj

%.obj: %.c
	zxc -c -O $(CFLAGS) $<
%.obj: %.as
	zas $<

$(TARGET): $(OBJS) 
	linq -Z -Dp1.sym -N -C -Mp1.map -Ptext=0,data,bss -C100H -O$@ $(CRT) $(OBJS) $(LIBS)
#	$(file >$@.in,-Z -Dp1.xym -N -C -Mp1.map -Ptext=0,data,bss -C100H -OP:$@ $(CRT) \)
#	$(foreach O,$(OBJS),$(file >>$@.in,P:$O \))
#	$(file >>$@.in,$(LIBS))
#	zxcc linq <$@.in
#	$(RM) $@.in

$(OBJS) : $(HDRS)

clean:
	$(RM) $(OBJS) *.map *.sym *.sym.sorted

compress:
	enhuff -a ZAS.HUF makefile $(CSRCS) $(HDRS)

