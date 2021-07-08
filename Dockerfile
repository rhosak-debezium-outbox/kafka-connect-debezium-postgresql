FROM quay.io/strimzi/kafka:0.22.1-kafka-2.7.0

ENV DEBEZIUM_VERSION=1.5.0.Final

USER root:root

COPY contrib/debezium-connector-postgres-${DEBEZIUM_VERSION} /opt/kafka/plugins/debezium-connector-postgres

COPY contrib/log4j.properties /opt/kafka/custom-config/log4j.properties

COPY contrib/kafka_connect_run_ocp.sh /opt/kafka/kafka_connect_run_ocp.sh

RUN chmod 755 /opt/kafka/kafka_connect_run_ocp.sh

USER 1001

CMD [ "sh", "-c", "/opt/kafka/kafka_connect_run_ocp.sh" ]
