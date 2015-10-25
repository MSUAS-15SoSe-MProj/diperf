FROM 	marbon87/rpi-spark
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#           6066 - spark rest api, 7077 = spark master service, 8080 = spark web UI
EXPOSE      6066 7077 8080

#           Start spark master with start-master.sh
ADD         spark-master.conf /etc/supervisor/conf.d/spark-master.conf
