FROM public.ecr.aws/docker/library/ubuntu:rolling
EXPOSE 80
#RUN mkdir -p /var/www/html/exams/
COPY ./src/* /var/www/html/