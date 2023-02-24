#!/bin/bash -eu

NAME=$1
DIR="../docs/${NAME}_number"

mkdir -p tmp
convert -crop "5%x50%" $DIR/number.png tmp/number.png
mv tmp/number-0.png $DIR/black_1.png
mv tmp/number-1.png $DIR/black_2.png
mv tmp/number-2.png $DIR/black_3.png
mv tmp/number-3.png $DIR/black_4.png
mv tmp/number-4.png $DIR/black_5.png
mv tmp/number-5.png $DIR/black_6.png
mv tmp/number-6.png $DIR/black_7.png
mv tmp/number-7.png $DIR/black_8.png
mv tmp/number-8.png $DIR/black_9.png
mv tmp/number-9.png $DIR/black_10.png
mv tmp/number-10.png $DIR/black_11.png
mv tmp/number-11.png $DIR/black_12.png
mv tmp/number-12.png $DIR/black_13.png
mv tmp/number-13.png $DIR/black_14.png
mv tmp/number-14.png $DIR/black_15.png
mv tmp/number-15.png $DIR/black_16.png
mv tmp/number-16.png $DIR/black_17.png
mv tmp/number-17.png $DIR/black_18.png
mv tmp/number-20.png $DIR/white_1.png
mv tmp/number-21.png $DIR/white_2.png
mv tmp/number-22.png $DIR/white_3.png
mv tmp/number-23.png $DIR/white_4.png
mv tmp/number-24.png $DIR/white_5.png
mv tmp/number-25.png $DIR/white_6.png
mv tmp/number-26.png $DIR/white_7.png
mv tmp/number-27.png $DIR/white_8.png
mv tmp/number-28.png $DIR/white_9.png
mv tmp/number-29.png $DIR/white_10.png
mv tmp/number-30.png $DIR/white_11.png
mv tmp/number-31.png $DIR/white_12.png
mv tmp/number-32.png $DIR/white_13.png
mv tmp/number-33.png $DIR/white_14.png
mv tmp/number-34.png $DIR/white_15.png
mv tmp/number-35.png $DIR/white_16.png
mv tmp/number-36.png $DIR/white_17.png
mv tmp/number-37.png $DIR/white_18.png
rm -rf tmp
