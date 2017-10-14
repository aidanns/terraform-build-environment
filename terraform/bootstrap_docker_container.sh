#!/usr/bin/env bash

CONTAINER_NAME=""

while getopts ":c:" opt; do
  case $opt in
    c)
      CONTAINER_NAME="${OPTARG}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "${CONTAINER_NAME}" ]; then
  echo "You must specify a container to bootstrap."
  exit 1
fi

echo "Bootstrapping container: ${CONTAINER_NAME}"

docker cp bootstrap_commands.sh ${CONTAINER_NAME}:/root/bootstrap_commands.sh
docker exec ${CONTAINER_NAME} /root/bootstrap_commands.sh

