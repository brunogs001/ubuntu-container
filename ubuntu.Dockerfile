FROM ubuntu:24.04

RUN apt-get update && apt-get install -y locales openssh-server && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN mkdir -p /var/run/sshd

RUN useradd -rm -d /home/bruno -s /bin/bash -g root -G sudo -u 2000 bruno
RUN echo 'bruno:bruno' | chpasswd

ENV LANG en_US.utf8

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
