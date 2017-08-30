#!/bin/bash

echo "Script for building:"
echo " - P7 library"
echo " - Examples"
echo " - Speed test"
echo " - Tracing tests"
echo "------------------------------------------------------------"


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export BUILD_DIR="$(pwd)/baical_p7"

if [ $# -lt 2 ] ; then
   echo "run [${SCRIPT_DIR}/build.sh clean] to make cleanup"
fi

echo "P7----------------------------------------------------------"

for i in Sources Tests/Speed Tests/Trace Examples/Cpp Examples/C; do
	echo "${i}-------------------------------------------------------"
	cd "${SCRIPT_DIR}/$i"
	make $1
done

