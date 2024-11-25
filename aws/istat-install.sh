#!/bin/bash

sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt update
sudo apt -y install gdal-bin python3 python3-venv python3-pip python3-dev libpq-dev 
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install GDAL osmium psycopg2 numpy pandas matplotlib jupyterlab ipython-sql ipython jupyter_contrib_nbextensions geopandas
