ARG BASE_IMAGE="alt:p10"

FROM ${BASE_IMAGE}

ARG SSD_APP_NAME=ssd-ui
ENV SSD_APP_NAME=${SSD_APP_NAME}

ARG SSD_INSTALLATION_PRIVILEGED_USER=root
USER ${SSD_INSTALLATION_PRIVILEGED_USER}

ARG SSD_USER_NAME=ssd
ARG SSD_USER_UID=10001
ARG SSD_USER_GID=${SSD_USER_UID}

ENV NGINX_LOGS="/var/log/nginx"
ENV NGINX_HOME="/etc/nginx"

COPY pl/${SSD_APP_NAME}.tar.gz ${NGINX_HOME}/html/
COPY docker/${SSD_APP_NAME}/mime.types ${NGINX_HOME}/mime.types
COPY docker/${SSD_APP_NAME}/nginx.conf ${NGINX_HOME}/nginx.conf
COPY docker/${SSD_APP_NAME}/start.sh /start.sh
COPY docker/common/shell/setup/* /usr/src/
COPY docker/common/shell/logrotate_loop.sh /logrotate_loop.sh
COPY docker/common/shell/vault_secret_await_loop.sh /vault_secret_await_loop.sh

RUN source /etc/os-release && \
      chmod 700 /usr/src/setup* && \
      /usr/src/setup_nginx.${ID}.sh && \
      tar -xzvf ${NGINX_HOME}/html/${SSD_APP_NAME}.tar.gz -C ${NGINX_HOME}/html/ && \
      rm -f ${NGINX_HOME}/html/${SSD_APP_NAME}.tar.gz && \
      groupadd --gid $SSD_USER_GID $SSD_USER_NAME && \
      useradd  --uid $SSD_USER_UID --gid $SSD_USER_GID -m $SSD_USER_NAME && \
      touch /var/run/nginx.pid && \
      touch /nginx.pid && \
      mkdir -p $NGINX_LOGS \
                $NGINX_HOME \
                /var/cache/nginx \
                /var/spool/nginx \
                /tmp/nginx \
                /var/log/ssd-v2/${SSD_APP_NAME} && \
      chown -R $SSD_USER_NAME \
                  $NGINX_HOME \
                  $NGINX_LOGS \
                  /var/lib \
                  /usr/share \
                  /var/spool/nginx \
                  /var/cache/nginx \
                  /var/run/nginx.pid \
                  /nginx.pid \
                  /tmp/nginx \
                  /var/log/ssd-v2/${SSD_APP_NAME} && \
      chown $SSD_USER_NAME /start.sh && \
      chmod +x /start.sh && \
      chown $SSD_USER_NAME /logrotate_loop.sh && \
      chmod +x /logrotate_loop.sh && \
      chmod +x /vault_secret_await_loop.sh


USER $SSD_USER_NAME

ENTRYPOINT ["/bin/bash"]
CMD ["/start.sh"]
