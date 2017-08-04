TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	tkdiff.wish

${TARGETS}::

clobber distclean:: clean

check::	tkdiff.wish
	./tkdiff.wish ${ARGS}

install:: tkdiff.wish
	${INSTALL} -D tkdiff.wish ${BINDIR}/tkdiff

uninstall::
	${RM} ${BINDIR}/tkdiff

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
