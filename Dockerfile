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

RUN echo " AllowAgentForwarding yes" >> /etc/ssh/sshd_config

RUN gem install capistrano -v 3.2.1

RUN apt-get clean -y

ADD .bashrc .bashrc

EXPOSE 22

ADD start.sh start.sh

CMD ["sh", "start.sh"]
