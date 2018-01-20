FROM ubuntu
USER root

# We remove the check_port plugin because rutorrent doesn't know the correct docker port
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/CyloTech/rtorrent-rutorrent-shared a && \
    cp ./a/extra.list /etc/apt/sources.list.d/extra.list && \
    apt-get update && \
    apt-get install -y rtorrent tar gzip unzip unrar mediainfo curl php-fpm php-cli php-geoip nginx wget ffmpeg supervisor php-xml libarchive-zip-perl libjson-perl libxml-libxml-perl irssi sox plowshare zip rar bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    cp ./a/rutorrent-*.nginx /root/ && \
    mkdir -p /var/www && \
    wget --no-check-certificate https://github.com/Novik/ruTorrent/archive/v3.8.tar.gz && \
    tar xzf v3.8.tar.gz && \
    mv ruTorrent-3.8 /var/www/rutorrent && \
    rm v3.8.tar.gz && \
    cp ./a/config.php /var/www/rutorrent/conf/ && \
    cp ./a/startup-rtorrent.sh ./a/startup-nginx.sh ./a/startup-php.sh ./a/startup-irssi.sh ./a/.rtorrent.rc /root/ && \
    cp ./a/supervisord.conf /etc/supervisor/conf.d/ && \
    sed -i 's#/var/log#/torrents/config/log#g' /etc/nginx/nginx.conf && \
    git clone https://github.com/nelu/rutorrent-thirdparty-plugins.git plugins && \
    mv ./plugins/filemanager  /var/www/rutorrent/plugins/ && \
    mv ./plugins/fileshare /var/www/rutorrent/plugins/ && \
    mv ./plugins/fileupload /var/www/rutorrent/plugins/ && \
    chmod 755 /var/www/rutorrent/plugins/filemanager/scripts/* && \
    mkdir -p /var/www/rutorrent/no-auth && \
    cp ./a/filemanager.conf /var/www/rutorrent/plugins/filemanager/conf.php && \
    ln -s /var/www/rutorrent/plugins/fileshare/share.php /var/www/rutorrent/no-auth/share.php && \
    rm -rf /var/www/rutorrent/plugins/check_port

EXPOSE 80 49160 49161

CMD ["supervisord"]

