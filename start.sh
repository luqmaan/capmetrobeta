
# http://developer.onebusaway.org/modules/onebusaway-application-modules/1.1.11/guides/transit-data-bundle-guide.html
java -Xmx1G -server -jar oba_full.war -build bundle.xml gtfs-bundle

vehloc_pb_url='https://data.texas.gov/api/file_data/PlHJDxPVnJinHu1jh-eQr-1YSYPLnxH6AjP1iFvz_IA?filename=VehLoc.pb'
java -jar oba_full.war \
    -webapp \
    -gtfsRealtimeVehiclePositionsUrl=$vehloc_pb_url \
    gtfs-bundle


api_key = '62a10bfb-8211-4863-9df1-44a6fab2b243'
