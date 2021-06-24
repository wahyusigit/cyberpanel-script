#!/bin/bash

echo "Enter your Panel Domain/Subdomain without http/https:"
read var1
echo -e "extprocessor cyberpanel {" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  type                    proxy" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  address                 https://$var1:8090" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  maxConns                100" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  pcKeepAliveTimeout      60" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  initTimeout             60" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  retryTimeout            0" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  respBuffer              0" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "}\n" >> /usr/local/lsws/conf/httpd_config.conf

touch /home/$var1/public_html/.htaccess
echo -e "REWRITERULE ^(.*)$ HTTP://cyberpanel/$1 [P]\n" >> /home/$var1/public_html/.htaccess

