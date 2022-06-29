#!/bin/bash -eu

NAME=$1

cd ../docs
zip -r ${NAME}.zip $NAME
