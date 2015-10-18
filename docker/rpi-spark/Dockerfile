FROM 	marbon87/rpi-ssh
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#       Install jave: from dordoka/rpi-java8----------------------------------
#       Install dependencies
RUN     echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN     echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN     echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN     apt-get update && apt-get install -y oracle-java8-installer --no-install-recommends

#       Define commonly used JAVA_HOME variable
ENV     JAVA_HOME=/usr/lib/jvm/java-8-oracle
RUN     echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile

#       Create user spark-----------------------------------------------------
RUN     useradd -p sa7dD6iNTV2jM -Ums /bin/bash spark && su spark

#       Download spark for user spark-----------------------------------------
RUN     su spark -c 'mkdir -p /home/spark/bin'
WORKDIR /home/spark/bin
RUN     su spark -c 'wget -qO- http://apache.openmirror.de/spark/spark-1.5.1/spark-1.5.1-bin-hadoop2.6.tgz | tar xz'
RUN     su spark -c 'ln -s spark-1.5.1-bin-hadoop2.6 spark'
RUN     su spark -c 'echo "export PATH=/home/spark/bin/spark/bin:$PATH" >> ~/.bashrc'

#       cleanup a bit---------------------------------------------------------
RUN     apt-get clean && apt-get purge

