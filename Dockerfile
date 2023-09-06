FROM public.ecr.aws/nginx/nginx:mainline
EXPOSE 80
COPY src/index.html /usr/share/nginx/html


#FROM public.ecr.aws/docker/library/ubuntu:rolling
#RUN mkdir -p /var/www/html/exams/
#COPY ./src/* /var/www/html/exams/