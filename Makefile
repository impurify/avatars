# By: impurify <have@anonymous.sex>
#
# This file: MIT License.
#
# I formally renounce any copyright interest in the output files.
# I didn’t create the original images, and I dedicate
# my modifications to the public domain.

IMGS=	img/rib_trn_plain.avatar-400.png \
	img/rib_trn_brdr.avatar-400.png

ZOPFLI=zopflipng --iterations=500 --filters=01234mepb

all: ${IMGS}

# XXX: The following rules intentionally overwrite the intermediate files,
# and there is some redundancy between make rules.
#
# I debated for too long how better to use make magic,
# then decided it is not worth the effort here.

# NOTABUG: -scale is used for an intentionally pixellated look.
# Vintage 90s GIFs!  Let’s go retro to when the Net was pro free speech.

# The following originally used maths:
#
#	-scale "`echo '(200*100)/sqrt((78/2)^2 + (134/2)^2)' | bc -l`%"
#
# Then, I gave up on maths and adjusted it manually
# to make the ribbon fill a circle.
#
img/rib_trn_plain.avatar-400.png: src/rib_trn_plain.gif
	convert -verbose \
		$< \
		-crop 78x134+3+3 \
		-scale 285% \
		-gravity center \
		-background transparent \
		-extent 400x400+0+6 \
		$@
	${ZOPFLI} $@ $@.new
	mv $@.new $@

# This one uses maths!
#
img/rib_trn_brdr.avatar-400.png: src/rib_trn_brdr.gif
	convert -verbose \
		$< \
		-scale "`echo '(200*100)/sqrt((181/2)^2 + (98/2)^2)' | bc -l`%" \
		-gravity center \
		-background transparent \
		-extent 400x400 \
		$@
	${ZOPFLI} $@ $@.new
	mv $@.new $@
