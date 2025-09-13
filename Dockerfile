# Base Image
FROM ubuntu:22.04
# Run commands
RUN apt update && apt install -y apache2 tree git
# Copy files to image
COPY hello /tmp
# Add environment variables
ENV app=team \
    team=devops \
    project=docker 
ADD https://wordpress.org/latest.tar.gz /tmp
# Set noninteractive terminal
ENV DEBIAN_FRONTEND=noninteractive
# Install wordpress dependencies
RUN apt install -y  ghostscript \
                    libapache2-mod-php \
                    mysql-server \
                    php \
                    php-bcmath \
                    php-curl \
                    php-imagick \
                    php-intl \
                    php-json \
                    php-mbstring \
                    php-mysql \
                    php-xml \
                    php-zip
# set working directory
WORKDIR /tmp
# unzip wordpress tar file
RUN tar -zxf latest.tar.gz && \
    mv wordpress/* /var/www/html && \
    chown -R www-data:www-data /var/www/html && \ 
    chmod -R 755 /var/www/html && \
    rm -r /var/www/html/index.html
# Expose port
EXPOSE 80
# Run command at container starup
CMD ["apachectl", "-DFOREGROUND"]

