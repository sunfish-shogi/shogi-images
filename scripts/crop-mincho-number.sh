#!/bin/bash -eu

DIR="../docs/mincho_number"

mkdir -p tmp
convert -crop "5%x100%" $DIR/number.png tmp/number.png
mv tmp/number-0.png $DIR/1.png
mv tmp/number-1.png $DIR/2.png
mv tmp/number-2.png $DIR/3.png
mv tmp/number-3.png $DIR/4.png
mv tmp/number-4.png $DIR/5.png
mv tmp/number-5.png $DIR/6.png
mv tmp/number-6.png $DIR/7.png
mv tmp/number-7.png $DIR/8.png
mv tmp/number-8.png $DIR/9.png
mv tmp/number-9.png $DIR/10.png
mv tmp/number-10.png $DIR/11.png
mv tmp/number-11.png $DIR/12.png
mv tmp/number-12.png $DIR/13.png
mv tmp/number-13.png $DIR/14.png
mv tmp/number-14.png $DIR/15.png
mv tmp/number-15.png $DIR/16.png
mv tmp/number-16.png $DIR/17.png
mv tmp/number-17.png $DIR/18.png
rm -rf tmp
