FROM public.ecr.aws/lts/apache2:latest
RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  	libapache2-mod-php8.2 \
    mysql-server \
		php8.2 \
		php8.2-bz2 \
		php8.2-cgi \
		php8.2-cli \
		php8.2-common \
		php8.2-curl \
		php8.2-dev \
		php8.2-enchant \
		php8.2-fpm \
		php8.2-gd \
		php8.2-gmp \
		php8.2-imap \
		php8.2-interbase \
		php8.2-intl \
		php8.2-json \
		php8.2-ldap \
		php8.2-mbstring \
		php8.2-mcrypt \
		php8.2-mysql \
		php8.2-odbc \
		php8.2-opcache \
		php8.2-pgsql \
		php8.2-phpdbg \
		php8.2-pspell \
		php8.2-readline \
		php8.2-recode \
		php8.2-snmp \
		php8.2-sqlite3 \
		php8.2-sybase \
		php8.2-tidy \
		php8.2-xmlrpc \
		php8.2-xsl \
		php8.2-zip
EXPOSE 80
COPY src/* /var/www/html/
