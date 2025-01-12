#!/bin/sh
#
# By: impurify <have@anonymous.sex>
#
# `chmod -x how.sh`
#
# This is documentation, not published as an executable script.
#
# It shows how file `no-photo.jpg` was created.
#
# TODO: Lossly optimize with jpegtran or such.
#
# TODO: Adjust the vertical offset to center the heart shape
# in a crop circle.  Oh, those avatar crop circles!
#

convert -verbose "${srcimg}" \
	-crop 125x125+$((3078-16))+2038 \
	+repage \
	-resize x444 \
	-bordercolor black \
	-border 18x18 \
	+repage -strip \
	-units PixelsPerInch -density 72x72 \
	no-photo.jpg

# I forgot which I used.  I think the latter.
# This is why all this should always be done and documented in git. :-(
#jpegtran -optimize no-photo.jpg
jpegoptim no-photo.jpg

exiftool \
	"-title=Photo of a “NO PHOTO” Sign" \
	"-author=have@anonymous.sex" \
	"-description=This image is based on a privacy violation that I’ve been intending to report.  I will not hereby accredit the original photographer, who blatantly took a sexually sensitive image in front of a “NO PHOTO” sign.  Although of course, I love pornography, there is a time and place for cameras!" \
	no-photo.jpg

sha256sum no-photo.jpg >> sha256.txt

jpegtran -copy all -optimize -progressive \
	-outfile no-photo-progressive.jpg no-photo.jpg

sha256sum no-photo-progressive.jpg >> sha256.txt
