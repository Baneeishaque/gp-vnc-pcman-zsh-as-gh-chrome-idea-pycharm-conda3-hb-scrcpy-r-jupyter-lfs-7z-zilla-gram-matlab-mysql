FROM baneeishaque/gp-vnc-tint2-pcman-zsh-as-gh-chrome-idea-pycharm-conda3-hb-scrcpy-r-jupyter-lfs-7z-zilla-gram-matlab

COPY mysql_pubkey.asc $HOME/

# Install MySQL
RUN sudo apt-key add $HOME/mysql_pubkey.asc \
 && echo "deb http://repo.mysql.com/apt/ubuntu/ focal mysql-8.0" > sudo /etc/apt/sources.list.d/mysql.list \
 && sudo apt update \
 && sudo apt install -y \
     mysql-server \
 && sudo rm -rf /var/lib/apt/lists/* \
 && sudo mkdir -p /var/run/mysqld /var/log/mysql \
 && sudo chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc
