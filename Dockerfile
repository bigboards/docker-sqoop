FROM bigboards/java-7-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# Download Pig
RUN curl -s http://www.eu.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./sqoop-1.4.6 pig

ENV SQOOP_HOME /opt/PIG
ENV PATH ${PATH}:${SQOOP_HOME}/bin

CMD ["/bin/bash"]
