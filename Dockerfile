FROM public.ecr.aws/lts/apache2:latest
EXPOSE 80
COPY src/* /usr/share/nginx/html/
