#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo    "********************************************";
#echo    "*                                          *";
echo -e   "* ${RED}       Event Display CLOSED! ${NC}            *";
#echo    "*                                          *";
echo    "********************************************";

_isRunning() {
    ps -o comm= -C "$1" 2>/dev/null | grep -x "$1" >/dev/null 2>&1
}
if _isRunning glced; then
    killall glced
fi
