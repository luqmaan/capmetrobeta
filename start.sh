
## create bundle
# http://developer.onebusaway.org/modules/onebusaway-application-modules/1.1.11/guides/transit-data-bundle-guide.html

# make sure the bundle directory doesn't exist already, otherwise you get `org.hibernate.HibernateException: Hibernate Dialect must be explicitly set`
# https://groups.google.com/forum/#!msg/onebusaway-developers/R79BYi0Lk_4/dbONkvjsgNQJ

# https://github.com/OneBusAway/onebusaway-application-modules/wiki/Stop-to-Shape-Matching

rm -rf gtfs-bundle
java -Xmx1G -server -jar oba_full.war -build bundle.xml gtfs-bundle \
    -P tripEntriesFactory.throwExceptionOnInvalidStopToShapeMappingException=false \
    -P distanceAlongShapeLibrary.localMinimumThreshold=50 \
    -P distanceAlongShapeLibrary.maxDistanceFromStopToShapePoint=1000

## start the server
vehloc_pb_url='https://data.texas.gov/api/file_data/PlHJDxPVnJinHu1jh-eQr-1YSYPLnxH6AjP1iFvz_IA?filename=VehLoc.pb'
java -jar oba_full.war \
    -webapp \
    -gtfsRealtimeVehiclePositionsUrl=$vehloc_pb_url \
    gtfs-bundle

# api_key = 'web'
# admin_user = 'admin'
# admin_pass = 'password'

# test some routes
curl http://localhost:8080/api/where/agencies-with-coverage.json?key=web
curl http://localhost:8080/api/where/routes-for-agency/666.json?key=web

# gtfs-rt-dump
vehloc_pb_url='https://data.texas.gov/api/file_data/PlHJDxPVnJinHu1jh-eQr-1YSYPLnxH6AjP1iFvz_IA?filename=VehLoc.pb'
java -jar gtfs-rt-dump-1.0-withAllDependencies.jar --url $vehloc_pb_url

