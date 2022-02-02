#!/bin/bash

DEBUG_MOZCONFIG="mozconfig-sccache-debug"
RELEASE_MOZCONFIG="mozconfig-sccache"

BUILD_DIR_FOR_DEBUG=".build-obj/debug"
BUILD_DIR_FOR_RELEASE=".build-obj/release"

CURRENT_DIR=$PWD

# Build Firefox
if [ "$1" == "debug" ]; then
    echo '**** Building debug build ****'
    MOZCONFIG=$PWD/$DEBUG_MOZCONFIG ./mach build -j 28
    echo '**** Building backend for clangd ****'
    MOZCONFIG=$PWD/$DEBUG_MOZCONFIG ./mach build-backend -b Clangd
    echo '**** Linking the compile_commands.json to current dir ****'
    ln -sf $BUILD_DIR_FOR_DEBUG/clangd/compile_commands.json $PWD/compile_commands.json
    echo '**** Build Complete ****'
elif [ "$1" == "release" ]; then
    echo '**** Building release build ****'
    MOZCONFIG=$PWD/$RELEASE_MOZCONFIG ./mach build -j 28
    echo '**** Building backend for clangd ****'
    MOZCONFIG=$PWD/$RELEASE_MOZCONFIG ./mach build-backend -b Clangd
    echo '**** Linking the compile_commands.json to current dir ****'
    ln -sf $BUILD_DIR_FOR_RELEASE/clangd/compile_commands.json $PWD/compile_commands.json
    echo '**** Build Complete ****'
elif [ "$1" == "run" ]; then
    if [ "$2" == "debug" ]; then
        RUN_CONFIG=$DEBUG_MOZCONFIG
    elif [ "$2" == "release" ]; then
        RUN_CONFIG=$RELEASE_MOZCONFIG
    fi
    BASE_RUN_COMMAND="MOZCONFIG=$PWD/$RUN_CONFIG ./mach run"
else
    echo 'Invalid build option'
    exit 1
fi
