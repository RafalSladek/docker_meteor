FROM debian:jessie
MAINTAINER Rafal Sladek <rafal.sladek@gmail.com>

# Install git, curl
RUN apt-get update && \
   apt-get install -y git curl && \
   (curl https://deb.nodesource.com/setup | sh) && \
   apt-get install -y nodejs jq && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir -p /var/www
RUN chown -R www-data:www-data /var/www

RUN curl https://install.meteor.com | /bin/sh

# Install entrypoint
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD []
