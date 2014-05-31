
#!/bin/bash
# Proper header for a Bash script.

# Run as root. You're installing stuff.
# Insert code here to print error message and exit if not root.

# Variables are better than hard-coded values.
PKGS=" cmake,
libboost-all-dev,
libxml2-dev,
libxml++2.6-dev,
libsqlite3-dev,
libhdf5-serial-dev,
libbz2-dev,
coinor-libcbc-dev,
coinor-libcoinutils-dev,
coinor-libosi-dev,
coinor-libclp-dev,
coinor-libcgl-dev"

for pkg in $PKGS
do

  sudo apt-get install
  echo pkg
done

echo "all done."

exit #  The right and proper method of "exiting" from a script.
     #  A bare "exit" (no parameter) returns the exit status
     #+ of the preceding command. 
