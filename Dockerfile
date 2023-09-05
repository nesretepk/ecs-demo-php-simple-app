#base working
#FROM public.ecr.aws/nginx/nginx:mainline
FROM public.ecr.aws/docker/library/ubuntu:rolling
EXPOSE 80
#COPY src/index.html /usr/share/nginx/html
