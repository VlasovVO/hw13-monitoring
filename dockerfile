FROM prom/prometheus:v2.1.0
COPY prometheus.yml /etc/prometheus/
USER root
RUN chmod 777 /etc/prometheus/prometheus.yml