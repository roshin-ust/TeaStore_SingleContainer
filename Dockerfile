FROM maven:3.6-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY TeaStore-master /tmp/
WORKDIR /tmp/
#COPY .m2 /root/.m2
RUN mvn clean install -DskipTests

FROM tomcat:8.5-jre8

COPY baseContext.xml /usr/local/tomcat/conf/context.xml

COPY mysql-connector-java-5.1.44-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.44-bin.jar

COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.auth/target/tools.descartes.teastore.auth.war /usr/local/tomcat/webapps/
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.image/target/tools.descartes.teastore.image.war /usr/local/tomcat/webapps/
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.persistence/target/tools.descartes.teastore.persistence.war /usr/local/tomcat/webapps/
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.recommender/target/tools.descartes.teastore.recommender.war /usr/local/tomcat/webapps/
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.registry/target/tools.descartes.teastore.registry.war /usr/local/tomcat/webapps/
COPY --from=MAVEN_TOOL_CHAIN /tmp/services/tools.descartes.teastore.webui/target/tools.descartes.teastore.webui.war /usr/local/tomcat/webapps/



