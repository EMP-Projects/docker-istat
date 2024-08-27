FROM osgeo/gdal:alpine-small-3.6.3

RUN mkdir /geojson
COPY ./geojson/limits_IT_regions.geojson /geojson/
COPY ./geojson/limits_IT_provinces.geojson /geojson/
COPY ./geojson/limits_IT_municipalities.geojson /geojson/

RUN mkdir /scripts
COPY ./scripts/* /scripts/

CMD ["sh", "/scripts/import.sh"]
