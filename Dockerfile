### This dockerfile can run a sample laravel example in docker container### 

##Base image
FROM mysql 

MAINTAINER Shashank Koppar<koppar.shashank@gmail.com>
 
## Specify user 
USER root

##Install php and composer 
RUN apt-get update 
RUN apt-get install curl php5-cli git php5-mysql -y 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN git clone https://github.com/bestmomo/laravel5-example.git
RUN cd laravel5-example/ && composer install &&  php artisan key:generate 

COPY entrypoint.sh /usr/local/bin/

##Expose the ports
EXPOSE 3306
EXPOSE 8000


ENTRYPOINT ["entrypoint.sh"]
