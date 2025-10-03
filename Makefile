# Copyright (C) 2007-2016 Rafael Durbano Lobato
#
# This file is part of Recursive Partitioning Algorithm.
#
# Recursive Partitioning Algorithm is free software: you can
# redistribute it and/or modify it under the terms of the GNU General
# Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
#
# Recursive Partitioning Algorithm is distributed in the hope that it
# will be useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Recursive Partitioning Algorithm. If not, see
# <http://www.gnu.org/licenses/>.
#
# Contact information:
#
# Rafael Durbano Lobato <rafael@lobato.it>
# http://lobato.it/

CC = g++
CFLAGS = -O3 -Wall -ansi -pedantic

all: RecPartAlgorithm

RecPartAlgorithm: RecPartAlgorithm.o bd.o draw.o draw_bd.o graphics.o sets.o util.o
	${CC} $^ -o $@

RecPartAlgorithm.o: RecPartAlgorithm.cpp bd.h sets.h draw.h graphics.h util.h
	${CC} ${CFLAGS} -c $<

bd.o: bd.cpp bd.h sets.h util.h
	${CC} ${CFLAGS} -c $<

draw.o: draw.cpp draw.h draw_bd.h util.h
	${CC} ${CFLAGS} -c $<

draw_bd.o: draw_bd.cpp draw_bd.h util.h
	${CC} ${CFLAGS} -c $<

graphics.o: graphics.cpp graphics.h
	${CC} ${CFLAGS} -c $<

sets.o: sets.cpp sets.h
	${CC} ${CFLAGS} -c $<

util.o: util.cpp util.h
	${CC} ${CFLAGS} -c $<

picture:
	mpost solution.mp
	latex solution.tex
	dvipdf solution.dvi
	xpdf solution.pdf

clean:
	rm -vf *.o