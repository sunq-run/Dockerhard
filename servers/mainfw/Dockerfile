FROM ubuntu:16.04
LABEL  maintainer "Takeyuki Sato <skjukjnqqqq@gmail.com>"
RUN apt-get update && apt-get install -y openssh-server
#Network tools
RUN apt-get install -y iputils-ping net-tools python netcat vim traceroute iptables
#Network Setting
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
RUN mkdir /var/run/sshd
RUN echo 'root:takeyuki' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
ADD routing.sh /root/
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

