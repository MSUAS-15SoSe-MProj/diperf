FROM 	mm/tiit-spark
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#           6066 - spark rest api, 7077 = spark master service, 8080 = spark web UI
ENV         SPARK_MASTER_PORT=7077
EXPOSE      6066 7077 8080

ENV         SPARK_MASTER_OPTS="-Dspark.driver.port=7001 \
            -Dspark.fileserver.port=7002 \
            -Dspark.broadcast.port=7003 \
            -Dspark.replClassServer.port=7004 \
            -Dspark.blockManager.port=7005 \
            -Dspark.executor.port=7006 \
            -Dspark.ui.port=4040 \
            -Dspark.history.ui.port=18080"
            
EXPOSE      4040 7001 7002 7003 7004 7005 7006 18080

#           Start spark master with start-master.sh
ADD         spark-master.conf /etc/supervisor/conf.d/spark-master.conf
