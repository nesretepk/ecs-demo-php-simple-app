FROM public.ecr.aws/lts/apache2:latest
RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN  add-apt-repository ppa:ondrej/php
RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  	libapache2-mod-php8.2 \
    mysql-server \
		php8.2 
EXPOSE 80
COPY src/* /var/www/html/
