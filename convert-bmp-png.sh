#!/bin/bash
# This file contains the commands I used on my 32GB RAM i7 machine to
# convert the huge BMPs to PNGs. Make sure to change the values to your
# needs. Interesting is, that, unlike documented, ImageMagick's
# environment variable for setting the temporary file path is not
# MAGICK_TMPFILE, but MAGICK_TEMPORARY_PATH.
export MAGICK_TEMPORARY_PATH=/home/lukas/
export MAGICK_MEMORY_LIMIT=25GiB
convert "$i" "$i.png"
