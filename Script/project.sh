#!/bin/bash
# Función que ejecutará el moogle
run_moogle(){
    cd ./../moogle-main
    make dev
}
# Funciones que mostrarán el Informe y la Presentación respectivamente
show_report(){
    FILENAME="Informe"
    DIRECTORY="./../Informe"
    show_pdf
}
show_slide(){
    FILENAME="Presentación"
    DIRECTORY="./../Presentación"
    show_pdf
}
# Funciones que crearán el Informe y la Presentación respectivamente
crear_report(){
    FILENAME="Informe"
    DIRECTORY="./../Informe"
    crear_pdf
}
crear_slide(){
    FILENAME="Presentación"
    DIRECTORY="./../Presentación"
    crear_pdf
}
#Funcion que creará los pdf a partir de los .tex
crear_pdf(){
    cd "${DIRECTORY}"
    pdflatex -interaction=batchmode -halt-on-error "${DIRECTORY}/${FILENAME}.tex" >/dev/null 2>&1
    pdflatex -interaction=batchmode -halt-on-error "${DIRECTORY}/${FILENAME}.tex" >/dev/null 2>&1
    echo "${FILENAME}.pdf creado con exito"
}

#Funcion para mostrar los pdf
show_pdf(){
    
    if [ -f "${DIRECTORY}/${FILENAME}.pdf" ]; then
        echo "Mostrando ${FILENAME}.pdf..."

        viewer=""
        if [ $# -eq 2 ]; then
         viewer="$2"
        fi

        if [ -z "$viewer" ]; then
            if command -v xdg-open &>/dev/null; then
                viewer="xdg-open"
                elif command -v open &>/dev/null; then
                viewer="open"
            fi
        fi 

        if [ -n "$viewer" ]; then
            $viewer "${DIRECTORY}/${FILENAME}.pdf"
            else
                echo "Lector de PDF no disponible"
        fi
        
         else
         echo "El archivo ${FILENAME}.pdf no existe"

        crear_pdf
        show_pdf
    fi
}

# Funcion para eliminar archivos auxiliares
clean_files(){
    
    cd ./../Informe
    rm -f "Informe.aux" "Informe.log" "Informe.out" "Informe.synctex.gz" "Informe.toc" "Informe.fls" "Informe.fdb_latexmk" "Informe.idx"

    cd ./../Presentación
    rm -f "Presentación.aux" "Presentación.log" "Presentación.out" "Presentación.synctex.gz" "Presentación.toc" "Presentación.fls" "Presentación.fdb_latexmk" "Presentación.vrb" "Presentación.nav" "Presentación.snm"

    echo "Archivos auxiliares eliminados"
}





# Main
case "$1" in
    run)
        run_moogle ;;
    clean)
        clean_files ;;
    report)
        crear_report;;
    slide)
        crear_slide;;
    show_report)
        show_report;;
    show_slide)
        show_slide;;
    *)
        echo "Opción no valida. Por favor ingrese una de las siguientes opciones : run , clean , report , slide , show_report , show_slide";;
esac