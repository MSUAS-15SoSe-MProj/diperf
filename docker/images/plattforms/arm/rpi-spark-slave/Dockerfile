FROM 	marbon87/rpi-spark
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#           7078 = spark slave service, 8081 = spark web UI
ENV         SPARK_WORKER_PORT=7078
EXPOSE      7078 8081

ENV         SPARK_WORKER_OPTS="-Dspark.driver.port=7001 \
            -Dspark.fileserver.port=7002 \
            -Dspark.broadcast.port=7003 \
            -Dspark.replClassServer.port=7004 \
            -Dspark.blockManager.port=7005 \
            -Dspark.executor.port=7006 \
            -Dspark.ui.port=4040 \
            -Dspark.history.ui.port=18080"

EXPOSE      4040 7001 7002 7003 7004 7005 7006 18080

#           Start spark slave with start-slave.sh
ADD         spark-slave.conf /etc/supervisor/conf.d/spark-slave.conf
#           Set default SPARK_MASTER
ENV         SPARK_MASTER=spark://pi1-docker:7077
