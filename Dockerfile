# Writen by Erik Hesse
# Company: Novartis NIBR
# Date: 7-29-2016

 FROM ubuntu:16.04

 MAINTAINER Erik Hesse <erik.hesse@msn.com>

 RUN apt-get update && apt-get install -y \
    cython             \
    git                \
    libmysqlclient-dev \
    libhdf5-dev        \
    libxml2-dev        \
    libxslt1-dev       \
    openjdk-8-jdk      \
    python-dev         \
    python-pip         \
    python-h5py        \
    python-matplotlib  \
    python-mysqldb     \
    python-scipy       \
    python-vigra       \
    python-wxgtk3.0    \
    python-zmq      

RUN git clone https://github.com/CellProfiler/CellProfiler.git /opt/CellProfiler
RUN cd /opt/CellProfiler/
RUN chmod -R o+w /usr/local/lib/python2.7/dist-packages /usr/local/bin
RUN pip install --editable /opt/CellProfiler/
RUN chmod -R o-w /usr/local/lib/python2.7/dist-packages /usr/local/bin
RUN pip install --upgrade pip
#RUN pip uninstall prokaryote
#RUN pip install prokaryote