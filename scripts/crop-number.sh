#!/bin/bash -eu

DIR="../docs/number"

mkdir -p tmp
convert -crop "10%x100%" $DIR/number.png tmp/number.png
mv tmp/number-0.png $DIR/1.png
mv tmp/number-1.png $DIR/2.png
mv tmp/number-2.png $DIR/3.png
mv tmp/number-3.png $DIR/4.png
mv tmp/number-4.png $DIR/5.png
mv tmp/number-5.png $DIR/6.png
mv tmp/number-6.png $DIR/7.png
mv tmp/number-7.png $DIR/8.png
mv tmp/number-8.png $DIR/9.png
rm -rf tmp
