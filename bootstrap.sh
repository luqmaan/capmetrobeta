## gtfs zip
gtfs_zip_url='https://data.texas.gov/api/file_data/RmVEH1KgATQsVU3m2eoAiyyWI2bTA8yMhDUxlOOoIyU?filename=google_transit.zip'
curl $gtfs_zip_url > gtfs.zip

## set agency id to 666
# unzip gtfs.zip -d gtfs
# rm gtfs.zip
# capmetro doesn't provide an agency id, set it to 666 for now
# sed -i "s/,Capital Metro/666,Capital Metro/" gtfs/agency.txt
# sed -i "s/,,/,666,/" gtfs/routes.txt
# zip gtfs.zip gtfs/*

## gtfs-rt
mkdir -p gtfs-rt
vehloc_pb_url='https://data.texas.gov/api/file_data/PlHJDxPVnJinHu1jh-eQr-1YSYPLnxH6AjP1iFvz_IA?filename=VehLoc.pb'
curl $vehloc_pb_url > gtfs-rt/VehLoc.pb

## oba war
oba_full_url='http://nexus.onebusaway.org/service/local/artifact/maven/content?r=public&g=org.onebusaway&a=onebusaway-quickstart-assembly&c=webapp&e=war&v=1.1.13'
curl $oba_full_url > oba_full.war

## gtfs-rt-dump
gtfs_rt_dump_url='https://github.com/kurtraschke/gtfs-rt-dump/releases/download/gtfs-rt-dump-1.0/gtfs-rt-dump-1.0-withAllDependencies.jar'
curl -L $gtfs_rt_dump_url > gtfs-rt-dump-1.0-withAllDependencies.jar


## create gtfs sqlite database
# install dependencies
virtualenv .env_py2
source .env_py2/bin/activate
pip install gtfsdb
# do it
source .env_py2/bin/activate
py_create_db="
import gtfsdb
from gtfsdb.api import database_load

GTFS_DB = 'gtfs.db'
GTFS_DOWNLOAD_FILE = 'gtfs.zip'
database_load(
    filename=GTFS_DOWNLOAD_FILE,
    batch_size=gtfsdb.config.DEFAULT_BATCH_SIZE,
    schema=gtfsdb.config.DEFAULT_SCHEMA,
    is_geospatial=gtfsdb.config.DEFAULT_IS_GEOSPATIAL,
    tables=None,
    url='sqlite:///{}'.format(GTFS_DB),
)
"
python -c $py_create_db
