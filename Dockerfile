FROM bigboards/java7-butterfly-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hadoop-2.6.0 hadoop

# Download Sqoop
RUN curl -s http://www.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./sqoop-1.4.6.bin__hadoop-2.0.4-alpha sqoop

# Download the JDBC drivers for Postgresql
RUN wget -P /opt/sqoop/lib/ https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar

# Download the JDBC drivers for mysql
RUN wget -P /tmp/ http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.tar.gz && tar -C /opt/sqoop/lib/ -xzf /tmp/mysql-connector-java-5.1.37.tar.gz

# Set the environment variables
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
