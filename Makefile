




render: report.Rmd
				Rscript -e "rmarkdown::render(input = 'analysis.Rmd',output_format = 'html_document')"

.PHONY: all

all:
	make load
	make tidy
	make figures
	make render

clean :
	rm -f analysis/output/*.dat
	rm -f analysis/output/*.png
