FROM phusion/baseimage
RUN apt-get update && apt-get install -y wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin && chmod +x ./jdk-6u45-linux-x64.bin && ./jdk-6u45-linux-x64.bin && mv ./jdk1.6.0_45 /usr/lib/
RUN wget http://downloads.sourceforge.net/project/openlaszlo/5.0.x/openlaszlo-5.0.x-unix.tar.gz && tar -zxvf openlaszlo-5.0.x-unix.tar.gz && mv lps-5.0.x /var/lib/
RUN mkdir /etc/service/lps && echo '#!/bin/sh' > /etc/service/lps/run && echo 'export JAVA_HOME=/usr/lib/jdk1.6.0_45' >> /etc/service/lps/run && echo '/var/lib/lps-5.0.x/Server/tomcat-5.0.24/bin/startup.sh && tail -F /var/lib/lps-5.0.x/Server/tomcat-5.0.24/logs/catalina.out' >> /etc/service/lps/run&& chmod +x /etc/service/lps/run
EXPOSE 8080
