FROM tomcat:9.0.84-jre8
LABEL Author=Tejaswini
ARG GOL_URL=https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war
ADD ${GOL_URL} /usr/local/tomcat/webapps/gameoflife.war
VOLUME [ "/usr/local/tomcat" ]
EXPOSE 8080
