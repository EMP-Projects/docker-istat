#!/bin/bash

# se la cartella geojson non esiste la crea
if [ ! -d "geojson" ]
then
    echo "Non trovo la cartella geojson"
    exit
fi

# legge tutti i file .geojson e li importa nel database
for file in geojson/*.geojson
do
    # estrae il nome del file
    table=$(basename $file .geojson)
    
    ogr2ogr -nlt PROMOTE_TO_MULTI -nln $table PG:"host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPWD dbname=$PGDB" $file -f "PostgreSQL" -s_srs EPSG:4326 -t_srs EPSG:3857
    
    # stampa a video il nome del file importato
    echo "Importato il file $file"
done