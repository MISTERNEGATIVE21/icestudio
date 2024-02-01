#!/bin/sh

#-- Terminal colors
NC="\033[0m"        #-- Reset colors
BLUE="\033[1;34m"
RED="\033[1;31m"
GREEN="\033[1;32m"

#-- Start repairing
APPDIR="dist/icestudio/osxarm64"
if [ -d $APPDIR ]; then

echo "${BLUE}Repairing OSX bundle${NC}"
find "${APPDIR}" -type f -exec file {} \; | grep -E 'Mach-O|dylib' |  cut -d: -f1 |  xargs -I {} chmod +x "{}"

#BASE_DIR=`find ${APPDIR} -d -name "nwjs Framework.framework"`
#ls "$BASE_DIR" | while read f ; do

#	is_link="$BASE_DIR"/"$f"

#	echo "    Check $is_link"
#	if [ -L "$is_link" ] ; then
#		echo "    =>${RED}Deleting $is_link${NC}"
#		rm -f "$is_link"
#   	else

#		echo "    =>${GREEN}Preserving $is_link${NC}"
#	fi
# done

#cp -R "$BASE_DIR"/Versions/A/* "$BASE_DIR"/
#cp -R "$BASE_DIR"/Versions/A "$BASE_DIR"/Versions/Current
##rm -rf "$BASE_DIR"/Versions/Current 

echo "    =>${BLUE}OSX bundle ${GREEN}OK${NC}"


else

echo "    =>${RED} OSX ARM64 bundle not found"
fi
