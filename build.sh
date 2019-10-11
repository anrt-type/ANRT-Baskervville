# Clean
rm ./fonts/Baskervville_TTF/*.ttf

 # Build static instances
fontmake -g ./sources/1-drawing/Baskervville-romain.glyphs -o ttf -i --output-dir ./fonts/Baskervville_TTF -a
fontmake -g ./sources/1-drawing/Baskervville-italic.glyphs -o ttf -i --output-dir ./fonts/Baskervville_TTF -a
for f in ./fonts/Baskervville_TTF/*.ttf
do
	echo 'Processing $f'
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# Clean up
rm -r instance_ufo
rm -r master_ufo

