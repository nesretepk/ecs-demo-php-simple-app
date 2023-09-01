FROM public.ecr.aws/ubuntu/ubuntu:latest

FROM ubuntu:latest
# disable package prompt interaction
ENV DEBIAN_FRONTEND noninteractive
# install required packages
ADD ./setup.sh /setup.sh
RUN chmod +x /setup.sh
RUN /setup.sh
# Install docker
RUN apt-get update &&  apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# install runit (init scheme)
RUN apt-get install -y runit
RUN apt-get install -y byobu
RUN apt-get install -y nano
RUN apt-get install -y htop

RUN rm -rf /etc/service
RUN mkdir -p /etc/service

RUN mkdir -p /etc/service/my_sql
# configure mysql service by using runit directive
RUN ln -s /etc/runit/runsvdir/default/my_sql /etc/service/my_sql
RUN echo "#!/bin/sh\n/etc/init.d/mysql start" > /etc/service/my_sql/run

RUN mkdir -p /etc/service/my_apache
# configure apache service by using runit directive
RUN ln -s /etc/runit/runsvdir/default/my_apache /etc/service/my_apache
RUN echo "#!/bin/bash\necho "start apache"\n/etc/init.d/apache2 start" > /etc/service/my_apache/run

# ports and entrypoint configuration
EXPOSE 3306 80
RUN rm -rf /boot
COPY boot /
RUN chmod +x /boot
RUN chmod +x /etc/service/my_sql/run
RUN chmod +x /etc/service/my_apache/run
RUN mkdir -p /var/www/html/exams/
COPY . /var/www/html/exams/
CMD [ "/boot" ]

