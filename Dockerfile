FROM ubuntu:latest
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

# Use bash, not dash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

RUN apt-get install -y curl git-core openssh-server ruby rubygems
RUN mkdir /var/run/sshd
RUN echo "root:root" | chpasswd

RUN echo " ForwardAgent yes" >> /etc/ssh/ssh_config
RUN echo " IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN echo " StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN gem install capistrano -v 2.15.5
RUN gem install capistrano-ext

RUN apt-get clean -y

EXPOSE 22

ADD start.sh start.sh

CMD ["sh", "start.sh"]
