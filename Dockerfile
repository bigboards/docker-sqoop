FROM bigboards/java7-butterfly-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hadoop-2.6.0 hadoop

# Download Sqoop
RUN curl -s http://www.eu.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./sqoop-1.4.6 sqoop

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_PREFIX /opt/hadoop
ENV YARN_HOME /opt/hadoop
ENV HADOOP_YARN_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_MAPRED_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HDFS_CONF_DIR /opt/hadoop/etc/hadoop
ENV YARN_CONF_DIR /opt/hadoop/etc/hadoop

ENV SQOOP_HOME /opt/sqoop
ENV PATH ${PATH}:${SQOOP_HOME}/bin:${HADOOP_HOME}/bin

CMD ["/bin/bash"]
