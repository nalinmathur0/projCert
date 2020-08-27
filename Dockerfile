FROM devopsedu/webapp
ADD Test.jar /var/www/html
RUN rm /var/www/html/index.html
CMD apachectl -D FOREGROUND
