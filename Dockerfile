FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host
# into this image
ADD home/admin12/Desktop/docker-seleium/selenium-docker-master/target/selenium-docker.jar 			selenium-docker.jar
ADD home/admin12/Desktop/docker-seleium/selenium-docker-master/target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD home/admin12/Desktop/docker-seleium/selenium-docker-master/target/libs							libs

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

# ADD suite files
ADD book-flight-module.xml				book-flight-module.xml
ADD search-module.xml					search-module.xml

# ADD health check script
ADD healthcheck.sh                      healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE

ENTRYPOINT sh healthcheck.sh