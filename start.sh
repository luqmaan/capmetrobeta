
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
vehloc_pb_url='https://data.texas.gov/api/file_data/FIMhW19BoaBhaoCIZSG3G5CGSx2KiAH7TDJI2KRB-ms?filename=VehLoc.pb'
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
vehloc_pb_url='https://data.texas.gov/api/file_data/FIMhW19BoaBhaoCIZSG3G5CGSx2KiAH7TDJI2KRB-ms?filename=VehLoc.pb'
java -jar gtfs-rt-dump-1.0-withAllDependencies.jar --url $vehloc_pb_url

# build one-bus-away war
oba_path="${HOME}/dev/onebusaway-application-modules"
cd $oba_path/onebusaway-quickstart && mvn clean
cd $oba_path/onebusaway-quickstart && mvn package
cp $oba_path/onebusaway-quickstart/onebusaway-quickstart-assembly/target/onebusaway-quickstart-assembly-1.1.13-webapp.war ~/dev/capmetrobeta

# run one-bus-away war
java -jar ~/dev/capmetrobeta/onebusaway-quickstart-assembly-1.1.14-webapp.war -webapp \
    -gtfsRealtimeAlertsUrl="https://data.texas.gov/download/nusn-7fcn/application/octet-stream" \
    -gtfsRealtimeTripUpdatesUrl="https://data.texas.gov/download/rmk2-acnw/application/octet-stream" \
    -gtfsRealtimeVehiclePositionsUrl="https://data.texas.gov/download/eiei-9rpf/application/octet-stream" \
    ~/dev/capmetrobeta/gtfs-bundle


java -Xmx1G -server -jar $oba_path/onebusaway-quickstart/onebusaway-quickstart-assembly/target/onebusaway-quickstart-assembly-1.1.13-webapp.war -build -help
