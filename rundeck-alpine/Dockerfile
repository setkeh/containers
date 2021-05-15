FROM setkeh/jdk-8-alpine:latest

LABEL maintainer "James Griffis <setkeh@gmail.com>"

ADD http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-3.3.11.jar /opt/rundeck/

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/opt/rundeck/etc", \
        "/opt/rundeck/var", \
        "/opt/rundeck/projects", \
        "/opt/rundeck/server/config", \
        "/opt/rundeck/server/data", \
        "/opt/rundeck/server/logs"]

EXPOSE 4440 4443
ENTRYPOINT ["/entrypoint.sh"]
