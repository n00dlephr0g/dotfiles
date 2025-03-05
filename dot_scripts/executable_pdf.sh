#!/bin/bash

file=$1
dir=$(dirname $file)
name_ext=$(basename $file)
name=${name_ext%.*}

pandoc $file -o "$dir/$name.pdf" -V geometry:margin=3cm -V fontsize=12pt

