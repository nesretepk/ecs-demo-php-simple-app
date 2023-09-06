FROM public.ecr.aws/docker/library/ubuntu:rolling
RUN mkdir -p /var/www/html/exams/
COPY ./src/* /var/www/html/exams/