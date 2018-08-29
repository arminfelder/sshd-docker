FROM       debian:stretch-slim
LABEL maintainer = "Armin Felder(https://github.com/arminfelder)"

RUN apt-get update\
 && apt-get install -y openssh-server \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^#?UsePAM\s+.*/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config


RUN mkdir /root/.ssh

VOLUME /root/.ssh

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
