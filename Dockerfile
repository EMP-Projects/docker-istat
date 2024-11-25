FROM osgeo/gdal:alpine-small-3.6.3

WORKDIR /root/geojson

COPY ./geojson/limits_IT_regions.geojson .
COPY ./geojson/limits_IT_provinces.geojson .
COPY ./geojson/limits_IT_municipalities.geojson .

WORKDIR /root
COPY ./scripts/istat-import.sh .
RUN chmod +x istat-import.sh

ENTRYPOINT ["~/istat-import.sh"]
