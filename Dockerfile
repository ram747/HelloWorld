FROM maven:3.6.3 as maven
WORKDIR /usr/src/app/
COPY Hello-world /usr/src/app/
RUN mvn clean install
#RUN mvn package

FROM tomcat:8.0-jre8
WORKDIR /usr/local/tomcat/webapps/
COPY --from=maven /usr/src/app/target/example.smallest-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/example.war
#COPY example.smallest-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
#COPY sample.war /usr/local/tomcat/webapps/
#COPY mkyong.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
