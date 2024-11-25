#!/bin/bash

# se la cartella geojson non esiste la crea
if [ ! -d "istat" ]
then
    echo "Non trovo la cartella istat"
    exit
fi

# legge tutti i file .geojson dalla cartella istat
shopt -s nullglob
files=(istat/*.geojson)

# verifica se ci sono file .geojson nella cartella
if [ ${#files[@]} -eq 0 ]; then
    echo "Non ci sono file .geojson nella cartella istat"
    exit
fi

# legge tutti i file .geojson e li importa nel database
for file in "${files[@]}"; do
    # estrae il nome del file
    table=$(basename "$file" .geojson)
    
    if ogr2ogr -nlt PROMOTE_TO_MULTI -nln "$table" PG:"host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPWD dbname=$PGDB" "$file" -f "PostgreSQL" -overwrite -s_srs EPSG:4326 -t_srs EPSG:3857; then
        # stampa a video il nome del file importato
        echo "Importato il file $file"
    else
        echo "Errore durante l'importazione del file $file"
        exit 1
    fi
done