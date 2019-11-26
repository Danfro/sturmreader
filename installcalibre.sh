#!/bin/bash

mkdir -p "$INSTALL_DIR"/calibre/PYTHON/lib/calibre/
mkdir -p "$INSTALL_DIR"/calibre/RESOURCES
mkdir -p "$INSTALL_DIR"/calibre/PYTHON/lib/python2.7/lib-dynload/

cp -r -p /usr/lib/calibre/* "$INSTALL_DIR"/calibre/PYTHON/lib/calibre
# Do resources really are needed? yes, at least the .py files
cp -r -p /usr/share/calibre/* "$INSTALL_DIR"/calibre/RESOURCES
cp -r -p /usr/lib/python2.7/ "$INSTALL_DIR"/calibre/PYTHON/lib/

# we copy only the calibre commands we use
cp -r -p calibre/calibredb "$INSTALL_DIR"/calibre/
cp -r -p calibre/calibre-customize "$INSTALL_DIR"/calibre/

# we delete resources we don't use
find "$INSTALL_DIR"/calibre/RESOURCES -type f \( -name "*.ico" -o -name "*.zip" -o -name "*.png" -o -name ".svg" -o -name "*.jpg" -o -name "*.gif" -o -name "*.css" -o -name "*.html" -o -name "*.htm" -o -name "*.js" \) -delete
find "$INSTALL_DIR"/calibre/RESOURCES -empty -type d -delete

find "$INSTALL_DIR"/calibre/PYTHON -type f -name "*.pyc" -delete
