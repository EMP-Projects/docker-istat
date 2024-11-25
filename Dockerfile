# Use the official Debian image as a base
FROM ubuntu:22.04

# Set environment variables
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Install required packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ppa && \
    apt-get update && \
    apt-get install -y \
        gdal-bin \
        python3 \
        python3-venv \
        python3-pip \
        python3-dev \
        libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install \
    GDAL \
    osmium \
    psycopg2 \
    numpy

WORKDIR /istat

COPY ./geojson/limits_IT_regions.geojson .
COPY ./geojson/limits_IT_provinces.geojson .
COPY ./geojson/limits_IT_municipalities.geojson .
COPY ./scripts/istat-import.sh .
RUN chmod +x /istat/istat-import.sh