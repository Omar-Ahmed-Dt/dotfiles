#!/bin/bash
pkg=$(checkupdates | wc -l)
echo "$pkg pkgs"
