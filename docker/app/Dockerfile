# syntax=docker/dockerfile:1
# Stage 1: build with Ant
FROM openjdk:8-jdk as build
RUN apt-get update && apt-get install -y --no-install-recommends ant && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
RUN ant -noinput build

# Stage 2: runtime with Tomcat
FROM tomcat:9.0-jdk8
ENV TZ=Asia/Shanghai

# clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# copy web resources and compiled classes
COPY --from=build /app/web/ /usr/local/tomcat/webapps/ROOT/

# override db.properties for container networking
COPY --from=build /app/src/config/spring/db.container.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/config/spring/db.properties

EXPOSE 8080
CMD ["catalina.sh", "run"]
