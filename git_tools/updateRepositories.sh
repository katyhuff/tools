
#!/bin/bash

# This is where I want my script to start.
cd ~/repos/

# Let the person running the script know what's going on.
echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

# Find all directories here - that are at least 1 level down, but don't go any 
# further than 1 directory.
# Go into those directories and pull the repository.
for i in $(find . -maxdepth 1 -mindepth 1 -type d); do
    echo -e "\033[1m"+$i+"\033[0m"; cd $i; git remote -v; git pull;
      cd ~/repos/
    done

    echo -e "\n\033[1mComplete! Do work son!\033[0m\n"
