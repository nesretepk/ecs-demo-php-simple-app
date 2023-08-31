FROM public.ecr.aws/lts/apache2:latest
RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

EXPOSE 80
COPY src/* /var/www/html/
