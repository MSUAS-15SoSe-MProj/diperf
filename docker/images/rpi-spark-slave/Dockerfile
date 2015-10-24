FROM 	marbon87/rpi-spark
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#           7078 = spark slave service, 8081 = spark web UI
EXPOSE      7078 8081

#           Start spark slave with start-slave.sh
ADD         spark-slave.conf /etc/supervisor/conf.d/spark-slave.conf
