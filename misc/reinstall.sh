#!/bin/bash
# This bash script updates all of the repositories
# Then, it reinstalls cyclus and all modules

# Before running this script, commit any changes you have made
# All changes will be stashed

# This is where I want my script to start.
TOP_DIR=~/repos/cyclus/
REPOS="cyclus
       cycamore
       streamblender
       commodconverter
       separationmatrix
       mktdriveninst"

INSTALL="python install.py --build_type=debug --prefix=../install"


cd $TOP_DIR

# Now, install cyclus
for i in $REPOS; do
    echo -e "\033[1mReinstalling $i \033[0m"; cd $i; $INSTALL;
      cd $TOP_DIR
    done

    echo -e "\n\033[1mCyclus and modules installed!!\033[0m\n"


