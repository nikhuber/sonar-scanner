FROM openjdk:8-jre-alpine

LABEL maintainer="Nikolaus Huber <nikolaus.huber@reservix.de>"

RUN apk add --no-cache curl sed

# Settings
ENV SONAR_URL=https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip

WORKDIR /root

# Install sonar-scanner
RUN curl --insecure -o ./sonarscanner.zip -L $SONAR_URL
RUN unzip sonarscanner.zip
RUN rm sonarscanner.zip

ENV SONAR_RUNNER_HOME=/root/sonar-scanner-3.0.3.778-linux
ENV PATH $PATH:/root/sonar-scanner-3.0.3.778-linux/bin

# COPY sonar-scanner.properties ./sonar-scanner-3.0.3.778-linux/conf/sonar-scanner.properties

# Ensure Sonar Scanner uses openjdk instead of the packaged JRE (which is broken)
RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /root/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner

COPY printScannerConfig.sh /root
RUN chmod +x /root/printScannerConfig.sh

CMD [ "/root/printScannerConfig.sh" ]