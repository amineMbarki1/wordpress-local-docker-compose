#!/bin/bash

server_name=$1
curl  -o /tmp/latest.zip  https://wordpress.org/latest.zip
unzip -o /tmp/latest.zip -d /tmp 
mkdir -p "Sites/${server_name}"
rsync -av  /tmp/wordpress/ "Sites/${server_name}"



nginx_conf="${server_name}.conf"

touch  "./vhosts/${nginx_conf}"
 
cat <<EOF > "./vhosts/${nginx_conf}"

server {
  listen 80;
  server_name $server_name www.${server_name};
  
  root /var/www/html/${server_name};
  index index.php;
  location / {
              try_files \$uri \$uri/ /index.php?\$args;
  }
  location ~ \.php$ {
        fastcgi_pass  wp-php-1:9000;
        fastcgi_param SCRIPT_FILENAME
                      \$document_root\$fastcgi_script_name;
        include       fastcgi_params;
    }
}
EOF

