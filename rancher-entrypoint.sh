#!/bin/bash

if [ "${AUTOCONFIG}" != "" ]; then
  case $AUTOCONFIG in
    aws)
      MAC=$(curl -s http://169.254.169.254/latest/meta-data/mac)
      export ZBX_PASSIVESERVERS=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${MAC}/vpc-ipv4-cidr-block)
      export ZBX_LISTENIP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
      ;;

    *)
      export ZBX_PASSIVESERVERS=$(ip -o -f inet addr show dev ${AUTOCONFIG} | awk '{print $4}')
      export ZBX_LISTENIP=$(ip -o -f inet addr show dev ${AUTOCONFIG} | awk '{print $4}' | cut -d/ -f1)
      ;;
  esac
fi

exec /usr/bin/docker-entrypoint.sh "$@"
