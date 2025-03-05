#!/bin/bash

file=$1
dir=$(dirname $file)
name=$(basename $file)

pandoc $file -o "$dir/$name.pdf" -V geometry:margin=3cm -V fontsize=12pt

