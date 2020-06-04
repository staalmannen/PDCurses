</$objtype/mkfile

LIB=libcurses.a

OFILES=\
# pdcurses \
	addch.$O\
	addchstr.$O\
	addstr.$O\
	attr.$O\
	beep.$O\
	bkgd.$O\
	border.$O\
	clear.$O\
	color.$O\
	debug.$O\
	delch.$O\
	deleteln.$O\
	getch.$O\
	getstr.$O\
	getyx.$O\
	inch.$O\
	inchstr.$O\
	initscr.$O\
	inopts.$O\
	insch.$O\
	insstr.$O\
	instr.$O\
	kernel.$O\
	keyname.$O\
	mouse.$O\
	move.$O\
	outopts.$O\
	overlay.$O\
	pad.$O\
	panel.$O\
	printw.$O\
	refresh.$O\
	scanw.$O\
	scr_dump.$O\
	scroll.$O\
	slk.$O\
	termattr.$O\
	touch.$O\
	util.$O\
	window.$O\
# plan9 \
	pdcclip.$O\
	pdcdisp.$O\
	pdcgetsc.$O\
	pdckbd.$O\
	pdcscrn.$O\
	pdcsetsc.$O\
	pdcutil.$O\
	pdcplan9.$O\

HFILES=\
	/sys/include/ape/curses.h\
	/sys/include/ape/panel.h\

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\
	${LIB:/$objtype/%=/386/%}\

</sys/src/cmd/mksyslib

CC=pcc
LD=pcc
CFLAGS= -c -I. -D_POSIX_SOURCE -D_BSD_EXTENSION -D_C99_SNPRINTF_EXTENSION \
-DHAVE_VSNPRINTF

%.$O: pdcurses/%.c
	$CC $CFLAGS pdcurses/$stem.c

%.$O: plan9/%.c
	$CC $CFLAGS plan9/$stem.c


install:V:
    cp libcurses.a /$objtype/lib/ape/libcurses.a
	cp curses.h /sys/include/ape/curses.h
	cp panel.h /sys/include/ape/

demos:V:
	@{
		cd demos
		mk all
	}

clean:V:
	@{
		cd demos
		mk clean
	}
	rm -f *.[$OS]

nuke:V:
	rm -f $LIB
	rm -f /$objtype/lib/ape/libcurses.a
	rm -f $HFILES
