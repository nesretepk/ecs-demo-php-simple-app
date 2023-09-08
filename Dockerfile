FROM public.ecr.aws/docker/library/php:8.1.23-apache
EXPOSE 80
COPY ./awshc/* /var/www/html/
RUN mkdir -p /var/www/html/exams/
COPY ./src/* /var/www/html/exams/
