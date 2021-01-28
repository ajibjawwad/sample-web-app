FROM tomcat:latest

MAINTAINER ajib jawwad

RUN echo "test env.properties file" > /usr/local/tomcat/

COPY /target/*.war /usr/local/tomcat/webapps/
