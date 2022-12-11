#!/bin/bash

outputfile="outputfiles/bluebike-data-$(date +"%y-%m-%d-%H-%M-%S").json"
curl -o "${outputfile}" https://data.stad.gent/api/records/1.0/search/?dataset=blue-bike-deelfietsen-gent-sint-pieters-m-hendrikaplein&q=&facet=name

