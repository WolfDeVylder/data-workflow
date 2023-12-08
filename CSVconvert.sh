#!/bin/bash

for file in *.json; do
	jq -r '["Tijdstip","Gebruikte fietsen","Vrije fietsen"],(.results[] |[.last_seen,.bikes_in_use,.bikes_available]) | @csv' "$file" >> "csvdataBB.csv"
done
