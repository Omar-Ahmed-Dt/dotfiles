#!/bin/bash
pdf_file="$(find . -type f | fzf)"
if [ -z "$pdf_file" ]
then
      echo "!!"
else
       zathura "$pdf_file" & disown 
fi
