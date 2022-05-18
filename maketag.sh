#!/bin/sh

if [ -z $1 ]; then
	echo "need to file for list to make tag !"
	exit 1;
fi

if [ ! -f $1 ]; then
	echo "File not Found !!!!"
	exit 1;
fi

FILES=$(cat $1)

rm -rf filelist
for file in $FILES
do
	find $file -name "*.[cChHsS]" -or -name "*.cpp" -or -name "*.hpp" >> filelist
done

ctags --langmap=C++:.c++.cc.cp.cpp.cxx.h.h++.hh.hp.hpp.hxx.C.H.ini.out -L filelist
