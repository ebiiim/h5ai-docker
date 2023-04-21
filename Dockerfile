FROM node:14

# git clone
RUN mkdir /work
WORKDIR /work
RUN git clone https://github.com/lrsjng/h5ai
WORKDIR /work/h5ai
# version: v0.30.0 (Jan 25, 2021)
RUN git checkout v0.30.0

# build
RUN npm install && npm run build

FROM php:8.1.18-apache-bullseye

# install prerequisites
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    ffmpeg imagemagick zip
RUN apt-get install -y --no-install-recommends \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev libxpm-dev libexif-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install -j$(nproc) gd exif
RUN apt-get clean -y && rm -rf /var/lib/apt/lists/*

COPY --from=0   /work/h5ai/build/_h5ai  /var/www/html/_h5ai
COPY            h5ai.conf               /etc/apache2/conf-enabled/h5ai.conf

RUN chown -v www-data:www-data /var/www/html/_h5ai/private/cache /var/www/html/_h5ai/public/cache

EXPOSE 80
CMD ["apache2-foreground"]
