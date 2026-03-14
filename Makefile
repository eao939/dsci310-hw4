# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: results/horse_pop_plot_largest_sd.png \
	results/horse_pops_plot.png \
	results/horses_spread.csv \
	reports/qmd_example.html \
	reports/qmd_example.pdf \
	docs/qmd_example.html \
	docs/qmd_example.pdf



# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.py
	python source/generate_figures.py --input_dir="data/00030067-eng.csv" \
		--out_dir="results"


# render quarto report in HTML and PDF - *changing this so that I render both at the same time*
reports/qmd_example.html reports/qmd_example.pdf: results reports/qmd_example.qmd
	quarto render reports/qmd_example.qmd 


# moving to docs folder
docs/qmd_example.html: reports/qmd_example.html
	mkdir -p docs
	mv reports/qmd_example.html docs/qmd_example.html

docs/qmd_example.pdf: reports/qmd_example.pdf
	mv reports/qmd_example.pdf docs/qmd_example.pdf


# clean
clean:
	rm -rf results
	rm -rf reports/qmd_example.html \
		reports/qmd_example.pdf \
		reports/qmd_example_files
	rm -rf docs
