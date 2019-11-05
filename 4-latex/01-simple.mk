buildsystem.pdf : buildsystem.tex buildsystem.aux \
	              buildsystem.bbl data_downloaded.aux \
				  playcount.pdf top_artists.csv
	latexmk -pdf buildsystem.tex

top_artists.csv : parse_charts.py top_artists.json
	./parse_charts.py top_artists.csv

playcount.pdf : parse_charts.py top_artists.json
	./parse_charts.py playcount.pdf

top_artists.json data_downloaded.tex : download_charts.sh
	./download_charts.sh

clean : 
	rm -f *.log *.aux *.big *.bbl

extraclean : clean
	rm -f buildsystem.pdf top_artists.json data_downloaded.tex playcount.pdf top_artists.csv