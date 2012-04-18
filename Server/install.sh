#!/bin/bash
mvn install:install-file -Dfile=dd-plist.jar -DgroupId=com.dd.plist \
    -DartifactId=property-list -Dversion=r66 -Dpackaging=jar
