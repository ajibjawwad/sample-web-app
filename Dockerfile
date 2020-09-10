FROM tomcat:latest

MAINTAINER ajib jawwad

COPY /target/*.war /usr/local/tomcat/webapps/
