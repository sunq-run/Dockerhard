FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y iputils-ping net-tools python netcat vim traceroute
#Network Setting
#$B%2!<%H%&%'%$$r(Bmainfw$B$K(B
#RUN route del default gw 10.2.2.1
#RUN route add default gw 10.2.2.251
####
RUN apt-get install -y supervisor
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
ADD ./scripts/send-ramdom.py /root/
ADD ./routing.sh /root/
RUN echo '[supervisord]'  >> /etc/supervisor/supervisord.conf
RUN echo 'nodaemon=true'  >> /etc/supervisor/supervisord.conf
RUN echo '[program:send-ramdom]' >> /etc/supervisor/supervisord.conf
RUN echo 'command=/usr/bin/python /root/send-ramdom.py'   >> /etc/supervisor/supervisord.conf
RUN echo 'stdout_logfile=/tmp/logfile' >> /etc/supervisor/supervisord.conf
RUN echo 'stderr_logfile_maxbytes=0' >> /etc/supervisor/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

