#!/bin/bash -eu

NAME=$1
DIR="../docs/${NAME}"

mkdir -p tmp
magick $DIR/piece.png -crop "12.5%x25%" tmp/piece.png
mv tmp/piece-0.png $DIR/black_king.png
mv tmp/piece-1.png $DIR/black_rook.png
mv tmp/piece-2.png $DIR/black_bishop.png
mv tmp/piece-3.png $DIR/black_gold.png
mv tmp/piece-4.png $DIR/black_silver.png
mv tmp/piece-5.png $DIR/black_knight.png
mv tmp/piece-6.png $DIR/black_lance.png
mv tmp/piece-7.png $DIR/black_pawn.png
mv tmp/piece-8.png $DIR/black_king2.png
mv tmp/piece-9.png $DIR/black_dragon.png
mv tmp/piece-10.png $DIR/black_horse.png
mv tmp/piece-12.png $DIR/black_prom_silver.png
mv tmp/piece-13.png $DIR/black_prom_knight.png
mv tmp/piece-14.png $DIR/black_prom_lance.png
mv tmp/piece-15.png $DIR/black_prom_pawn.png
mv tmp/piece-16.png $DIR/white_king.png
mv tmp/piece-17.png $DIR/white_rook.png
mv tmp/piece-18.png $DIR/white_bishop.png
mv tmp/piece-19.png $DIR/white_gold.png
mv tmp/piece-20.png $DIR/white_silver.png
mv tmp/piece-21.png $DIR/white_knight.png
mv tmp/piece-22.png $DIR/white_lance.png
mv tmp/piece-23.png $DIR/white_pawn.png
mv tmp/piece-24.png $DIR/white_king2.png
mv tmp/piece-25.png $DIR/white_dragon.png
mv tmp/piece-26.png $DIR/white_horse.png
mv tmp/piece-28.png $DIR/white_prom_silver.png
mv tmp/piece-29.png $DIR/white_prom_knight.png
mv tmp/piece-30.png $DIR/white_prom_lance.png
mv tmp/piece-31.png $DIR/white_prom_pawn.png
rm -rf tmp
