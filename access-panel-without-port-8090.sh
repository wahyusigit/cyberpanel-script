#!/bin/bash

echo "Panel Domain/Subdomain without http/https"
read var1
echo -e "extprocessor cyberpanel { \n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  type                    proxy\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  address                 https://$var1:8090\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  maxConns                100\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  pcKeepAliveTimeout      60\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  initTimeout             60\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  retryTimeout            0\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "  respBuffer              0\n" >> /usr/local/lsws/conf/httpd_config.conf
echo -e "}\n" >> /usr/local/lsws/conf/httpd_config.conf

echo -e "REWRITERULE ^(.*)$ HTTP://cyberpanel/$1 [P]\n" >> /home/$var1/public_html/.htaccess

