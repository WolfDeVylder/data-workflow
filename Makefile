
.PHONY: run clean

all: csv_convert dubbelsBB pythontoPNG csv-to-md

csv_convert:
	bash csv_convert.sh -o csvdataBB.csv

dubbelsBB:
	bash dubbelsBB.sh -o csvdataBB.csv

pythontoPNG:
	bash pythontoPNG.sh

csv-to-md:
	bash csv-to-md.sh -o csvdataBB.md

clean:
	rm -v csvdataBB.csv csvdataBB.md