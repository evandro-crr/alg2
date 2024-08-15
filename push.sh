#!/bin/bash

mkdir -p public/slides
cp index.html public/
cp slides/*html public/slides
cp slides/img public/slides/ -r
pipx run ghp-import public -p -o