FROM public.ecr.aws/lts/ubuntu:latest

EXPOSE 80
COPY src/* /var/www/html/
