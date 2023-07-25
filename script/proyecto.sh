#! /bin/bash

run() {
    echo "Ejecutando el proyecto"
    cd ../
    make dev
    cd script
}
report() {
echo "Compilando y generando el PDF del informe..."
cd ../Informe
pdflatex informe.tex
pdflatex informe.tex
cd ../script
}

slides() {
echo "Compilando y generando el PDF de la presentacion..."
cd ../Presentacion
pdflatex Presentacion.tex
pdflatex Presentacion.tex
cd ../script
}

show_report() {
    viewer_command="${2:-xdg-open}"
    if [ -f ../Informe/informe.pdf ]
    then $viewer_command ../Informe/informe.pdf
    else
     report
     $viewer_command ../Informe/informe.pdf
     fi
}

show_slides() {
    viewer_command="${2:-xdg-open}"
    if [ -f ../Presentacion/Presentacion.pdf ]
    then $viewer_command ../Presentacion/Presentacion.pdf
    else
    slides
    $viewer_command ../Presentacion/Presentacion.pdf
    fi

}
clean() {
    cd ../Informe
    rm *.aux
    rm *.bbl
    rm *.fdb_latexmk
    rm *.fls
    rm *.log
    rm *.pdf
    rm *.synctex.gz
    rm *.toc
    cd ../Presentacion
    rm *.nav
    rm *.out
    rm *.snm
    rm *.aux
    rm *.fdb_latexmk
    rm *.fls
    rm *.log
    rm *.pdf
    rm *.synctex.gz
    rm *.toc
    cd ../script

}
case $1 in 
run)
 run
;;
report) 
 report
;;
slides) 
 slides
;;
show_report)
 show_report
;;
show_slides)
 show_slides
;;
clean)
 clean
;;
*)
 echo "Opcion invalida"
 echo "Las opciones disponibles son run, report, slides, show_report, show_slides, clean"
 exit 1
;;
esac
