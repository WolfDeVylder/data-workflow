#!/bin/bash

for file in *.json; do
	jq -r '["Tijdstip","Gebruikte fietsen","Vrije fietsen"],(.records[] | [.record_timestamp,.fields.bikes_in_use,.fields.bikes_available]) | @csv' "$file" >> "csvdataBB.csv"
done
