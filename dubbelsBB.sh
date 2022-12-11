#!/bin/bash

if [ ! -f "csvdataBB.csv" ]; then
    echo "Error: csvdataBB.csv does not exist"
    exit 1
fi

awk '!seen[$0]++' csvdataBB.csv > csvdata-filtered.csv

mv csvdata-filtered.csv csvdataBB.csv
