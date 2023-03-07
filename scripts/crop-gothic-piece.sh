#!/bin/bash -eu

NAME=gothic
DIR="../docs/${NAME}"

mkdir -p tmp
convert -crop "12.5%x50%" $DIR/piece.png tmp/piece.png
mv tmp/piece-0.png $DIR/king.png
mv tmp/piece-1.png $DIR/rook.png
mv tmp/piece-2.png $DIR/bishop.png
mv tmp/piece-3.png $DIR/gold.png
mv tmp/piece-4.png $DIR/silver.png
mv tmp/piece-5.png $DIR/knight.png
mv tmp/piece-6.png $DIR/lance.png
mv tmp/piece-7.png $DIR/pawn.png
mv tmp/piece-8.png $DIR/king2.png
mv tmp/piece-9.png $DIR/dragon.png
mv tmp/piece-10.png $DIR/horse.png
mv tmp/piece-12.png $DIR/prom_silver.png
mv tmp/piece-13.png $DIR/prom_knight.png
mv tmp/piece-14.png $DIR/prom_lance.png
mv tmp/piece-15.png $DIR/prom_pawn.png
rm -rf tmp
