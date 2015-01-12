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
