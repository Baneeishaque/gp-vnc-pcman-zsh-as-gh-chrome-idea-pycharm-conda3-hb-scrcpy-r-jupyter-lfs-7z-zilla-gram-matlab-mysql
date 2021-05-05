FROM baneeishaque/gp-vnc-tint2-pcman-zsh-as-gh-chrome-idea-pycharm-conda3-hb-scrcpy-r-jupyter-lfs-7z-zilla-gram-matlab

# Install MySQL
RUN sudo install-packages mysql-server-5.7 \
 && sudo mkdir -p /var/run/mysqld /var/log/mysql \
 && sudo chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc
