#!/bin/bash 
verbose=false
ignore=false
pdf=false
biber=false
bibtex=false
xelatex=false
pdflatexCmd="pdflatex --output-directory=build/"
xelatexCmd="xelatex --output-directory=build/"
cmd=""
for parameter in $1 $2 $3 $4 $5 $6; do
	if [ $parameter == "-verbose" ]; then
		verbose=true
	fi
	if [ $parameter == "-pdf" ]; then
		pdf=true
	fi
	if [ $parameter == "-ignore" ]; then
		ignore=true
	fi
	if [ $parameter == "-xelatex" ]; then
		xelatex=true
	fi
	if [ $parameter == "-biber" ]; then
		biber=true
	elif [ $parameter == "-bibtex" ]; then
		bibtex=true
	fi
done

#xelatex or pdflatex
if [ $xelatex == true ]; then
	cmd=$xelatexCmd
else
	cmd=$pdflatexCmd
fi

#ignore errors
if [ $ignore == true ]; then
	cmd=$cmd' -interaction=nonstopmode'
fi
cmd=$cmd' main.tex'

#log
if [ $verbose == false ]; then
	cmd=$cmd' > /dev/null 2>&1'
fi

#latex
eval $cmd

#biber
if [ $biber == true ]; then
	eval 'biber build/main.bcf'
	eval $cmd
fi

#bibtex
if [ $bibtex == true ]; then
	eval 'bibtex build/main.aux'
	eval $cmd
	eval $cmd
fi

#PDF
if [ $pdf == true ]; then
	if [[ "$ostype" == "linux-gnu"* ]]; then
		nohup evince build/main.pdf > build/evince.log &
	elif [[ "$ostype" == "darwin"* ]]; then
		nohup open build/main.pdf > build/open.log &
	fi
fi
