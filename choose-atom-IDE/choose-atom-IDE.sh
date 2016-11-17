#!/usr/bin/bash

# If you use Atom and you have too many packages based on 
# your dev tools, probably easier to group them into dir 
# based on your dev tools. Ex:
# 
# you want to install nuclide package, delete $HOME/.atom
# then "apm install nuclide", mv $HOME/.atom $HOME/.atom-nuclide, 
# 
# Do that for other dev tools, then use this script to manage them
#
echo "Current choice:"
echo
if [ -e "$HOME/.atom" ]; then
  ls -la $HOME | grep "\->" | grep "atom"
  echo
else
  echo "Atom packages have not been activated yet"
  echo
fi

echo "Choose your Atom IDE package:"
echo "[1] Go"
echo "[2] Rust"
echo "[3] Nuclide (React Native)"
echo "[4] Julia"
echo "[5] Delete symlink $HOME/.atom"
echo "[x] Exit"
echo
echo "Your choice: "
read pil

if [ "$pil" == 1 ]; then
  echo "Proceed with Go ..."
  if [ -e "$HOME/.atom" ]; then
    rm "$HOME/.atom"
  fi
  ln -s $HOME/.atom-go $HOME/.atom
elif [ "$pil" == 2 ]; then
  echo "Proceed with Rust ..."
  if [ -e "$HOME/.atom" ]; then
    rm "$HOME/.atom"
  fi
  ln -s $HOME/.atom-rust $HOME/.atom
elif [ "$pil" == 3 ]; then
  echo "Proceed with Nuclide ..."
  if [ -e "$HOME/.atom" ]; then
    rm "$HOME/.atom"
  fi
  ln -s $HOME/.atom-nuclide $HOME/.atom
elif [ "$pil" == 4 ]; then
  echo "Proceed with Julia"
  if [ -e "$HOME/.atom" ]; then
    rm "$HOME/.atom"
  fi
  ln -s $HOME/.atom-julia $HOME/.atom
elif [ "$pil" == 5 ]; then
  echo "Delete $HOME/.atom symlink"
  rm "$HOME/.atom"
else
  echo "Finish"
fi
