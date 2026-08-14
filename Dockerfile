FROM scratch
ENV LANG=C.UTF-8
#https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/
ADD latest-stable/alpine-minirootfs-3.23.0-aarch64.tar.gz /
VOLUME /var/lib/grafana
RUN apk add --no-cache openssh grafana
#RUN add 'PermitRootLogin yes' in line37 using sed -i
#to sshd_config (can't write here) before running build proccess 
RUN ssh-keygen -A
COPY grafana.ini /etc/grafana.ini
RUN apk cache clean && rm -rf /var/cache/apk/*
EXPOSE 22 3000
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/bin/sh"]
