#!/bin/bash

#ILC_SOFT=/home/calice/Desktop/ILCSoftInstall/ilcsoft
#MY_INSTALL=/home/calice/Desktop/CaliceInstall/build/myInstall

export MARLIN_DLL=

ILC_SOFT="/cvmfs/ilc.desy.de/sw/x86_64_gcc48_sl6/v01-17-11"
MY_INSTALL="/afs/desy.de/user/l/lomidze/afs/newCaliceSoft_2/CaliceInstall/build/myInstall/"

export reconstructedSlcioPath="/afs/desy.de/user/l/lomidze/afs/EventDisplay/data/"


source ${ILC_SOFT}/init_ilcsoft.sh



export MARLIN_DLL=${MY_INSTALL}/lib/libuserlib.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/libcaliceAnalysis.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/libraw2calohit.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/libcellGeometry.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/librecoSiPM.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/liblabview2lcio.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/libclustering.so
export MARLIN_DLL=${MARLIN_DLL}:${MY_INSTALL}/lib/libRootTreeWriter.so

# skip unloading processors
# to avoid the problems to release the root library at the end of Marlin job
export MARLIN_DEBUG=1

#next line prevents empty cdb.log file
export COND_DB_DEBUGLOG=/dev/stdout

export CED_PORT=7927
#exec ${ILC_SOFT}/Marlin/*/bin/Marlin $@
