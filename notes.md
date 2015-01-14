## FIXME for CapMetro

### Please specify agency id everywhere

For now we can work around this by specifying defaultAgencyId in bundle.xml

- VehLoc.json needs agency id
- gtfs.zip/agency.txt needs agency id
- gtfs.zip/routes.txt needs agency id in each row

### Stop to Shape matching

See bundle.bad_shape_points.md

https://github.com/OneBusAway/onebusaway-application-modules/wiki/Stop-to-Shape-Matching

```java
2015-01-12 09:41:09,883 ERROR [FederatedTransitDataBundleCreatorMain.java:220] : error building transit data bundle
java.lang.IllegalStateException: Multiple instances of InvalidStopToShapeMappingException thrown: count=277.  For more information on errors of this kind, see:
  https://github.com/OneBusAway/onebusaway-application-modules/wiki/Stop-to-Shape-Matching
    at org.onebusaway.transit_data_federation.bundle.tasks.transit_graph.TripEntriesFactory.processTrips(TripEntriesFactory.java:130)
    at org.onebusaway.transit_data_federation.bundle.tasks.transit_graph.TransitGraphTask.run(TransitGraphTask.java:103)
    at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
    at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke(Method.java:483)
    at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:309)
    at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183)
    at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
    at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
    at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
    at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:202)
    at com.sun.proxy.$Proxy65.run(Unknown Source)
    at org.onebusaway.transit_data_federation.bundle.FederatedTransitDataBundleCreator.run(FederatedTransitDataBundleCreator.java:192)
    at org.onebusaway.transit_data_federation.bundle.FederatedTransitDataBundleCreatorMain.run(FederatedTransitDataBundleCreatorMain.java:218)
    at org.onebusaway.transit_data_federation.bundle.FederatedTransitDataBundleCreatorMain.main(FederatedTransitDataBundleCreatorMain.java:91)
    at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
    at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke(Method.java:483)
    at org.onebusaway.quickstart.bootstrap.BuildBootstrapMain.main(BuildBootstrapMain.java:32)
    at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
    at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke(Method.java:483)
    at org.onebusaway.quickstart.bootstrap.BootstrapMain$1.run(BootstrapMain.java:199)
    at java.lang.Thread.run(Thread.java:745)
```

### Route IDS in VehLoc.pb are wrong

```sh
gtfs_rt_dump_url='https://github.com/kurtraschke/gtfs-rt-dump/releases/download/gtfs-rt-dump-1.0/gtfs-rt-dump-1.0-withAllDependencies.jar'
curl -L $gtfs_rt_dump_url > gtfs-rt-dump-1.0-withAllDependencies.jar
vehloc_pb_url='https://data.texas.gov/api/file_data/PlHJDxPVnJinHu1jh-eQr-1YSYPLnxH6AjP1iFvz_IA?filename=VehLoc.pb'
java -jar gtfs-rt-dump-1.0-withAllDependencies.jar --url $vehloc_pb_url
```

```pb
header {
  gtfs_realtime_version: "1.0"
  timestamp: 1421008603
}
entity {
  id: "1"
  vehicle {
    trip {
      trip_id: "1400641"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61808"
    }
    position {
      latitude: 30.41177
      longitude: -97.6638
      speed: 18.44
    }
    vehicle {
      id: "5019"
    }
  }
}
entity {
  id: "2"
  vehicle {
    trip {
      trip_id: "801002"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61814"
    }
    position {
      latitude: 30.180164
      longitude: -97.783
      speed: 37.32
    }
    vehicle {
      id: "5010"
    }
  }
}
entity {
  id: "3"
  vehicle {
    trip {
      trip_id: "1400640"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61808"
    }
    position {
      latitude: 30.337135
      longitude: -97.719154
      speed: 1.23
    }
    vehicle {
      id: "5016"
    }
  }
}
entity {
  id: "4"
  vehicle {
    trip {
      trip_id: "801004"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61814"
    }
    position {
      latitude: 30.260988
      longitude: -97.748795
      speed: 28.25
    }
    vehicle {
      id: "5022"
    }
  }
}
entity {
  id: "5"
  vehicle {
    trip {
      trip_id: "1400638"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61808"
    }
    position {
      latitude: 30.22246
      longitude: -97.766525
      speed: 1.78
    }
    vehicle {
      id: "5001"
    }
  }
}
entity {
  id: "6"
  vehicle {
    trip {
      trip_id: "801006"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61814"
    }
    position {
      latitude: 30.370712
      longitude: -97.69281
      speed: 3.15
    }
    vehicle {
      id: "5003"
    }
  }
}
entity {
  id: "7"
  vehicle {
    trip {
      trip_id: "1400637"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61808"
    }
    position {
      latitude: 30.162867
      longitude: -97.790436
    }
    vehicle {
      id: "5015"
    }
  }
}
entity {
  id: "8"
  vehicle {
    trip {
      trip_id: "801051"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61814"
    }
    position {
      latitude: 30.418205
      longitude: -97.66827
    }
    vehicle {
      id: "5011"
    }
  }
}
entity {
  id: "9"
  vehicle {
    trip {
      trip_id: "801090"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61814"
    }
    position {
      latitude: 30.296545
      longitude: -97.74214
      speed: 20.41
    }
    vehicle {
      id: "5012"
    }
  }
}
entity {
  id: "10"
  vehicle {
    trip {
      trip_id: "1400639"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61808"
    }
    position {
      latitude: 30.276167
      longitude: -97.74243
      speed: 13.98
    }
    vehicle {
      id: "5014"
    }
  }
}
entity {
  id: "11"
  vehicle {
    trip {
      trip_id: "1401117"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61820"
    }
    position {
      latitude: 30.235935
      longitude: -97.79275
      speed: 19.19
    }
    vehicle {
      id: "5059"
    }
  }
}
entity {
  id: "12"
  vehicle {
    trip {
      trip_id: "803002"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61826"
    }
    position {
      latitude: 30.399862
      longitude: -97.72045
    }
    vehicle {
      id: "5051"
    }
  }
}
entity {
  id: "13"
  vehicle {
    trip {
      trip_id: "803003"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61826"
    }
    position {
      latitude: 30.266075
      longitude: -97.75374
      speed: 16.93
    }
    vehicle {
      id: "5055"
    }
  }
}
entity {
  id: "14"
  vehicle {
    trip {
      trip_id: "1401118"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61820"
    }
    position {
      latitude: 30.379814
      longitude: -97.724915
      speed: 24.48
    }
    vehicle {
      id: "5053"
    }
  }
}
entity {
  id: "15"
  vehicle {
    trip {
      trip_id: "1401133"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61820"
    }
    position {
      latitude: 30.278368
      longitude: -97.74161
      speed: 8.56
    }
    vehicle {
      id: "5056"
    }
  }
}
entity {
  id: "16"
  vehicle {
    trip {
      trip_id: "803006"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61826"
    }
    position {
      latitude: 30.298168
      longitude: -97.7411
      speed: 14.25
    }
    vehicle {
      id: "5057"
    }
  }
}
entity {
  id: "17"
  vehicle {
    trip {
      trip_id: "803050"
      start_time: "14:34"
      start_date: "20150111"
      route_id: "61826"
    }
    position {
      latitude: 30.363342
      longitude: -97.729034
      speed: 1.64
    }
    vehicle {
      id: "5060"
    }
  }
}
entity {
  id: "18"
  vehicle {
    trip {
      trip_id: "803051"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61826"
    }
    position {
      latitude: 30.23467
      longitude: -97.79582
      speed: 9.84
    }
    vehicle {
      id: "5061"
    }
  }
}
entity {
  id: "19"
  vehicle {
    trip {
      trip_id: "1401134"
      start_time: "14:35"
      start_date: "20150111"
      route_id: "61820"
    }
    position {
      latitude: 30.3164
      longitude: -97.73581
      speed: 0.1
    }
    vehicle {
      id: "5063"
    }
  }
}
```

### Add timestamp to VehiclePosition

  // Moment at which the vehicle's position was measured. In POSIX time
  // (i.e., number of seconds since January 1st 1970 00:00:00 UTC).
  optional uint64 timestamp = 5;
