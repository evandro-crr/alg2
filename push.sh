#!/bin/bash

mkdir -p public/slides
mkdir -p public/listas

for file in slides/*.md
do
    npx @marp-team/marp-cli@latest $file -o public/$(dirname $file)/$(basename $file .md).html --html 1
done
npx @marp-team/marp-cli@latest index.md -o public/index.html --html 1
cp listas/*pdf public/listas
cp slides/img public/slides/ -r
pipx run ghp-import public -p -o