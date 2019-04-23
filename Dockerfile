FROM rootproject/root-ubuntu16
MAINTAINER agarim
RUN sudo apt-get update -yqq
RUN sudo apt-get install wget curl vim -yqq
RUN sudo apt-get install libncurses5-dev groff -yqq
RUN sudo wget http://downloads.sourceforge.net/project/myman/myman-cvs/myman-cvs-2009-10-30/myman-wip-2009-10-30.tar.gz
RUN sudo tar -xzf myman-wip-2009-10-30.tar.gz
RUN cd myman-wip-2009-10-30 && sudo ./configure && sudo make && sudo make install