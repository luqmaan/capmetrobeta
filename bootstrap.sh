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
