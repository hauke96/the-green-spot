#!/bin/bash

convert $1.jpg -resize 100x100 $1.png

convert $1.png -bordercolor black -fill white \
   \( -clone 0 -colorize 100 -shave 6x6 -border 6x6 -blur 0x3 \) \
   -compose copyopacity -composite $1_output.png

convert $1_output.png -flatten $1_output.jpg

rm -f $1.png
rm -f $1_output.png

#convert $1.jpg -alpha set -virtual-pixel transparent \
#          -channel A -blur 0x8  -level 50%,100% +channel $1_output.jpg

#convert $1.jpg gradient:white-none[1x20!] -background none -virtual-pixel edge \
#   \( -clone 0 -crop x20+0+0 \) \( -clone 0 -crop 20x+0+0 -rotate 90 \) \
#   \( -clone 1-3 +append -distort affine "0,0 %[w],0" \) \
#   \( -clone 0,4 -composite -rotate 90 -clone 4 -composite -rotate 90 \
#      -clone 4 -composite -rotate 90 -clone 4 -composite -rotate 90 \) \
#   -delete 0--2 -quality 100 $1_output.jpg
