#! /bin/sh

if [ -z "$ALTERNATIVE_CPP_LIB_PATH" ]; then
    declare -x ALTERNATIVE_CPP_LIB_PATH=`pwd`
fi

declare -x ALTERNATIVE_LIB_BUILD=$ALTERNATIVE_CPP_LIB_PATH/build
declare -x ALTERNATIVE_LIB_BIN=$ALTERNATIVE_LIB_BUILD/bin

if [ ! -d "$ALTERNATIVE_LIB_BIN" ]; then
  mkdir $ALTERNATIVE_LIB_BIN
fi

cd $ALTERNATIVE_LIB_BIN
rm CMakeCache.txt
#cmake -G "Unix Makefiles" ..
emcmake cmake -G "Unix Makefiles" ..
make -j12

if [ ! -d "$ALTERNATIVE_LIB_BUILD/libfiles" ]; then
  mkdir $ALTERNATIVE_LIB_BUILD/libfiles
fi

cp $ALTERNATIVE_LIB_BIN/src/libSystem.a $ALTERNATIVE_LIB_BUILD/libfiles
cp $ALTERNATIVE_LIB_BIN/src/public/gc/libgc-lib.a $ALTERNATIVE_LIB_BUILD/libfiles

cd $ALTERNATIVE_CPP_LIB_PATH
