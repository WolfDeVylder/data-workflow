
.PHONY: run clean

all: CSVconvert dubbelsBB pythonToPng csv-to-md

CSVconvert:
	bash CSVconvert.sh -o csvdataBB.csv

dubbelsBB:
	bash dubbelsBB.sh -o csvdataBB.csv

pythonToPng:
	bash pythonToPng.sh

csv-to-md:
	bash csv-to-md.sh -o csvdataBB.md

clean:
	rm -v csvdataBB.csv csvdataBB.md
