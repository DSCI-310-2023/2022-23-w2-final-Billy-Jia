# write the report
report.md : report.Rmd analysis/output/figure.png results/figure/last.png results/figure/sierra.png
	Rscript -e "rmarkdown::render('doc/count_report.Rmd')"

clean :
	rm -f analysis/output/*.dat
	rm -f analysis/output/*.png
