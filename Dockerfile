FROM httpd:2.4

COPY ./Certificates/* /usr/local/apache2/conf/
RUN rm -f /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY ./Conf/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

RUN apachectl restart

