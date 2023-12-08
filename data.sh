#!/bin/bash

outputfile="outputfiles/bluebike-data-gsp-$(date +"%y-%m-%d-%H-%M-%S").json"
curl -o "${outputfile}" https://data.stad.gent/api/explore/v2.1/catalog/datasets/blue-bike-deelfietsen-gent-sint-pieters-st-denijslaan/records?limit=20



