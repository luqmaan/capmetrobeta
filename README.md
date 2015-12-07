# capmetrobeta

Messing around with OBA for Austin.

# Get OBA Running from scratch

Download OBA

```
oba_full_url='http://nexus.onebusaway.org/service/local/artifact/maven/content?r=public&g=org.onebusaway&a=onebusaway-quickstart-assembly&c=webapp&e=war&v=1.1.14'
curl $oba_full_url > oba_full.war
```

Download GTFS zip

```
curl -L -o gtfs.zip https://data.texas.gov/download/r4v4-vz24/application/zip
```

## Set up OBA

bundle.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">
    <bean id="gtfs-bundles" class="org.onebusaway.transit_data_federation.bundle.model.GtfsBundles">
        <property name="bundles">
            <list>
                <ref bean="gtfsCapMetro" />
            </list>
        </property>
    </bean>
    <bean id="gtfsCapMetro" class="org.onebusaway.transit_data_federation.bundle.model.GtfsBundle">
        <property name="path" value="/Users/luqmaan/dev/capmetrobeta/gtfs.zip" />
    </bean>
</beans>
```

```
java -Xmx1G -server -jar oba_full.war -build bundle.xml gtfs-bundle \
    -P tripEntriesFactory.throwExceptionOnInvalidStopToShapeMappingException=false \
    -P distanceAlongShapeLibrary.localMinimumThreshold=50 \
    -P distanceAlongShapeLibrary.maxDistanceFromStopToShapePoint=1000

java -Xmx1G -server -jar oba_full.war -webapp \
    -gtfsRealtimeAlertsUrl="https://data.texas.gov/download/nusn-7fcn/application/octet-stream" \
    -gtfsRealtimeTripUpdatesUrl="https://data.texas.gov/download/rmk2-acnw/application/octet-stream" \
    -gtfsRealtimeVehiclePositionsUrl="https://data.texas.gov/download/eiei-9rpf/application/octet-stream" \
    gtfs-bundle
```

## Test it works

```
curl http://localhost:8080/api/where/agencies-with-coverage.json?key=web
curl http://localhost:8080/api/where/routes-for-agency/1.json?key=web
http://localhost:8080/api/where/stops-for-location.json?key=web&lat=30.267153&lon=-97.743061
```
