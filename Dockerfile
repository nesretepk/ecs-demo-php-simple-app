#FROM public.ecr.aws/docker/library/ubuntu:rolling
#FROM public.ecr.aws/nginx/nginx:mainline

FROM public.ecr.aws/docker/library/php:8.1.23-apache
EXPOSE 80

#COPY src/index.html /usr/share/nginx/html

RUN mkdir -p /var/www/html/exams/
COPY ./src/* /var/www/html/