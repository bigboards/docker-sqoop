FROM bigboards/java7-butterfly-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# Download Sqoop
RUN curl -s http://www.eu.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./sqoop-1.4.6 sqoop

ENV HADOOP_HOME /opt/hadoop
ENV SQOOP_HOME /opt/sqoop
ENV PATH ${PATH}:${SQOOP_HOME}/bin

CMD ["/bin/bash"]
