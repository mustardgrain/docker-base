FROM ubuntu:14.04

MAINTAINER Kirk True <kirk@mustardgrain.com>

# Set up local time
RUN \
    sudo ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime ; \
    echo "The current time is `date`"

# Update everything
RUN \
    apt-get update ; \
    apt-get upgrade -y

# Set up Java 8
RUN \
  apt-get install -y software-properties-common ;  \
  add-apt-repository -y ppa:webupd8team/java ; \
  apt-get update ; \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections ; \
  apt-get install -y oracle-java8-installer

# Install wget
RUN \
    apt-get install -y wget curl vim

# Clean up temp files
RUN \
    ls -l /tmp ; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

