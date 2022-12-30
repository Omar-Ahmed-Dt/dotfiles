#!/usr/bin/env bash

cd ~/scripts/ && ls | dmenu -l 30 | xargs sh 
