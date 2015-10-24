FROM 	marbon87/rpi-spark
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#           7078 = spark slave service, 8081 = spark web UI
EXPOSE      7078,8081

#           Start spark master with start-master.sh
ADD         spark-master.conf /etc/supervisor/conf.d/spark-master.conf
