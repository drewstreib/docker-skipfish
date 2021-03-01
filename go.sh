#!/bin/bash
mkdir -p out
docker run --rm -v$(pwd)/out:/out drewstreib/skipfish -o /out/$1 "https://$1"
