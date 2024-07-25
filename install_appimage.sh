#!/bin/bash

app_name=$1
app_folder=$2

# Fix execution path
path_prefix="$HOME/.local/opt/$app_folder/"
# sed -i "s|^\(Exec=\)\(.*\)|\1$prefix\2|" "$app_folder/$app_name.desktop"
sed -i "s|^\(Exec=\)\(.*\)|\1$path_prefix\2|" "$app_folder/$app_name.desktop"

# Install icons
cp -r "$app_folder/usr/share/icons/"* "$HOME/.local/share/icons/"

# Create .desktop file
cp "$app_folder/$app_name.desktop" "$HOME/.local/share/applications/"
