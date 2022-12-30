#!/bin/bash
# pdf_file="$(ls | grep .pdf | fzf)"
# pdf_file="$(ls | grep .pdf | fzf)"
# if [ -z "$pdf_file" ]
# then
#       echo "!!"
# else
#        zathura "$pdf_file" & disown 
# fi

pdf_file="$(find -iname "*.pdf" | fzf )"
if [ -z "$pdf_file" ]
then
      echo "!!"
else
       zathura "$pdf_file" & disown 
fi
