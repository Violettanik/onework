#!/usr/bin/env bash

/vault_secret_await_loop.sh

if [[ -z $NGINX_CONFIG ]]; then
  NGINX_CONFIG="${NGINX_HOME:-/etc/nginx}/nginx.conf"
fi

#sed -i "s|<NGINX_UI_SERVER_NAME>|${NGINX_UI_SERVER_NAME:-ssd-ui.local}|g" "${NGINX_CONFIG}" && \
#    sed -i "s|<SSD_LAUNCH_USER>| ${SSD_LAUNCH_USER:-root}|g" "${NGINX_CONFIG}" && \
#    sed -i "s|<NGINX_WORKER_PROCESSES>| ${NGINX_WORKER_PROCESSES:-5}|g" "${NGINX_CONFIG}" && \
#    sed -i "s|<NGINX_WORKER_CONNECTIONS>| ${NGINX_WORKER_CONNECTIONS:-4096}|g" "${NGINX_CONFIG}" && \
#    sed -i "s|<NGINX_WORKER_RLIMIT_NOFILE>| ${NGINX_WORKER_RLIMIT_NOFILE:-8192}|g" "${NGINX_CONFIG}" && \
#    sed -i "s|<NGINX_LARGE_CLIENT_HEADER_BUFFER_CONFIG>| ${NGINX_LARGE_CLIENT_HEADER_BUFFER_CONFIG:-4 32k}|g" "${NGINX_CONFIG}"


#if [[ -n "${LOG_ROTATION_CONF_FILE}" ]]; then
#    /logrotate_loop.sh "${LOG_ROTATION_CONF_FILE}" "${LOG_ROTATION_PERIOD_SECONDS:-3600}" &
#fi

#nginx -g "daemon off;" -c "${NGINX_CONFIG}"

# рабочая копия
RUNTIME_NGINX_CONFIG="/tmp/nginx.conf"
cp "${NGINX_CONFIG}" "${RUNTIME_NGINX_CONFIG}"

# подставляем переменные в копию
sed -i "s|<NGINX_UI_SERVER_NAME>|${NGINX_UI_SERVER_NAME:-ssd-ui.local}|g" "${RUNTIME_NGINX_CONFIG}"
sed -i "s|<SSD_LAUNCH_USER>|${SSD_LAUNCH_USER:-root}|g" "${RUNTIME_NGINX_CONFIG}"
sed -i "s|<NGINX_WORKER_PROCESSES>|${NGINX_WORKER_PROCESSES:-5}|g" "${RUNTIME_NGINX_CONFIG}"
sed -i "s|<NGINX_WORKER_CONNECTIONS>|${NGINX_WORKER_CONNECTIONS:-4096}|g" "${RUNTIME_NGINX_CONFIG}"
sed -i "s|<NGINX_WORKER_RLIMIT_NOFILE>|${NGINX_WORKER_RLIMIT_NOFILE:-8192}|g" "${RUNTIME_NGINX_CONFIG}"
sed -i "s|<NGINX_LARGE_CLIENT_HEADER_BUFFER_CONFIG>|${NGINX_LARGE_CLIENT_HEADER_BUFFER_CONFIG:-4 32k}|g" "${RUNTIME_NGINX_CONFIG}"

# запуск logrotate если нужно
if [[ -n "${LOG_ROTATION_CONF_FILE}" ]]; then
    /logrotate_loop.sh "${LOG_ROTATION_CONF_FILE}" "${LOG_ROTATION_PERIOD_SECONDS:-3600}" &
fi

# запускаем nginx с копией конфига
nginx -g "daemon off;" -c "${RUNTIME_NGINX_CONFIG}"

