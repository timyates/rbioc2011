TOP=../..
PKG=${shell cd ${TOP};pwd}
SUITE=doRUnit.R
R=${R_HOME}/bin/R

all: inst test

inst: # Install package
	cd ${TOP}/..;\
	${R} CMD INSTALL ${PKG}

test: # Run unit tests
	export RCMDCHECK=FALSE;\
	export RUNITFILEPATTERN="$(file)";\
	export RUNITFUNCPATTERN="$(func)";\
	cd ${TOP}/tests;\
	${R} --vanilla --slave < ${SUITE}
