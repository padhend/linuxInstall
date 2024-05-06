# Install LAMP stack
### https://www.golinuxcloud.com/install-phpmyadmin-rocky-linux-9/
sudo dnf -y install vim bash-completion curl wget telnet
sudo sestatus
sudo dnf -y install httpd
sudo vi /etc/httpd/conf/httpd.conf
sudo systemctl start httpd
sudo systemctl enable http
sudo systemctl enable httpd
sudo firewall-cmd --add-service={http,https} --permanent
sudo firewall-cmd --reload
sudo dnf -y install php php-cli php-mbstring php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip
timedatectl
sudo dnf install mariadb-server -y
sudo vim /etc/my.cnf.d/mariadb-server.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation 
sudo firewall-cmd --add-service=mysql --permanent
sudo firewall-cmd --reload
sudo vim /var/www/html/phpinfo.php
sudo systemctl restart httpd

### phpmyadmin
dnf -y install phpmyadmin
dnf -y install epel-release
dnf -y install phpmyadmin
sudo vi /etc/httpd/conf.d/phpMyAdmin.conf
---
Alias /pma /usr/share/phpMyAdmin

<Directory /usr/share/phpMyAdmin/>
    AddDefaultCharset UTF-8
    Require local
    Require all granted
</Directory>
---

systemctl restart httpd

