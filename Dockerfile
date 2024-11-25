FROM osgeo/gdal:alpine-small-3.6.3

WORKDIR /root/geojson

COPY ./scripts/geojson/limits_IT_regions.geojson .
COPY ./scripts/geojson/limits_IT_provinces.geojson .
COPY ./scripts/geojson/limits_IT_municipalities.geojson .

WORKDIR /root/scripts
COPY ./scripts/istat-import.sh .
RUN chmod +x istat-import.sh

ENTRYPOINT ["~/scripts/istat-import.sh"]
