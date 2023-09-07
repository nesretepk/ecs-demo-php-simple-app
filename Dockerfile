#FROM public.ecr.aws/docker/library/ubuntu:rolling
FROM public.ecr.aws/docker/library/php:8.1.23-apache
EXPOSE 80
RUN mkdir -p /var/www/html/exams/
COPY ./src/* /var/www/html/exams/