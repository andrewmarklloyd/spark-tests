# Version: 0.0.1
FROM ubuntu:16.04
MAINTAINER Sean Farrell "Sean.Farrell@ogsystems.com"

# Note: Documentation says to always combine RUN apt-get update with apt-get install in the same RUN statement.

#
# Tools required later.
#

RUN apt-get update && \
    apt-get install -y curl wget && \
    rm -rf /var/lib/apt/lists/*

#
# Java
#

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer \
    oracle-java8-unlimited-jce-policy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#
# Titan
#

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip && \
    unzip /opt/titan.zip -d /opt/ && \
    ln -s /opt/titan-1.0.0-hadoop1 /opt/titan && \
    rm /opt/titan.zip

#
# Scala/SBT
#

ENV SCALA_HOME /opt/scala
ENV SCALA_VERSION 2.11.8
ENV SBT_VERSION 0.13.12

RUN curl -fsL http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /opt/ && \
    ln -s /opt/scala-$SCALA_VERSION $SCALA_HOME

RUN curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
    dpkg -i sbt-$SBT_VERSION.deb && \
    rm sbt-$SBT_VERSION.deb && \
    apt-get install sbt && \
    sbt sbtVersion

#
# Spark
#

# TODO: Change to version 2.0 when we know this all works with 1.6.1 first.
ENV SPARK_VERSION      1.6.1
ENV SPARK_BIN_VERSION  $SPARK_VERSION-bin-hadoop2.6
ENV SPARK_HOME         /opt/spark
ENV PATH               $PATH:$SPARK_HOME/bin

RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_BIN_VERSION.tgz && \
    tar -zxf /spark-$SPARK_BIN_VERSION.tgz -C /opt/ && \
    ln -s /opt/spark-$SPARK_BIN_VERSION $SPARK_HOME && \
    rm /spark-$SPARK_BIN_VERSION.tgz

#
# CMake
#

RUN apt-get update && \
    apt-get install -y cmake && \
    rm -rf /var/lib/apt/lists/*

#
# Utilities
#

RUN apt-get update && \
    apt-get install -y gcc g++ git vim && \
    rm -rf /var/lib/apt/lists/*

#
# SparkTitanTests
#

ENV SERVER https://github.com

RUN mkdir /sources && \
    cd /sources && \
    git clone $SERVER/shawks03/SparkTitanTests.git && \
    cd SparkTitanTests && \
    mkdir build && \
    cd build && \
    cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release && \
    make
