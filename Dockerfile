FROM php:8.0-apache
RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql
	
COPY dog-breed-search.html /var/www/html/
COPY website-dog-breed-db.php /var/www/html/
#COPY ./database-data /var/www/html/
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/
RUN echo "DirectoryIndex dog-breed-search.html" >> /etc/apache2/apache2.conf


EXPOSE 8081
CMD ["apache2-foreground"]