#!/bin/bash

if [ "${LISTENIP_FROM}" != "" ]; then
  case $LISTENIP_FROM in
    aws)
      export ZBX_LISTENIP=$(curl -s 'http://169.254.169.254/latest/meta-data/local-ipv4')
      ;;

    *)
      export ZBX_LISTENIP=$(ip -o -f inet addr show dev ${LISTENIP_FROM} | awk '{print $4}' | cut -d/ -f1)
      ;;
  esac
fi

exec /usr/bin/docker-entrypoint.sh "$@"
