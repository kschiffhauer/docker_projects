
FROM python:2.7

# Download and extract OpsCenter
RUN \
  mkdir /opt/opscenter; \
  wget -O - --user=jega@valtanix.net --password=Simple123 http://downloads.datastax.com/enterprise/opscenter-5.2.4.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/opscenter";

ADD	. /src

# Copy over daemons
RUN	\
  mkdir -p /etc/service/opscenter; \
  cp /src/run /etc/service/opscenter/; \
  ln -s /opt/opscenter/log /var/log/opscenter;

# Expose ports
EXPOSE 8888

# Service ports
EXPOSE 61620

WORKDIR /opt/opscenter

#CMD ["/sbin/my_init"]
CMD ["/src/run"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*