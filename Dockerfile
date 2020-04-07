FROM tomcat:8.5-jre8

COPY baseContext.xml /usr/local/tomcat/conf/context.xml

COPY mysql-connector-java-5.1.44-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.44-bin.jar

COPY ./TeaStore-master/services/tools.descartes.teastore.auth/target/tools.descartes.teastore.auth.war /usr/local/tomcat/webapps/
COPY ./TeaStore-master/services/tools.descartes.teastore.image/target/tools.descartes.teastore.image.war /usr/local/tomcat/webapps/
COPY ./TeaStore-master/services/tools.descartes.teastore.persistence/target/tools.descartes.teastore.persistence.war /usr/local/tomcat/webapps/
COPY ./TeaStore-master/services/tools.descartes.teastore.recommender/target/tools.descartes.teastore.recommender.war /usr/local/tomcat/webapps/
COPY ./TeaStore-master/services/tools.descartes.teastore.registry/target/tools.descartes.teastore.registry.war /usr/local/tomcat/webapps/
COPY ./TeaStore-master/services/tools.descartes.teastore.webui/target/tools.descartes.teastore.webui.war /usr/local/tomcat/webapps/



