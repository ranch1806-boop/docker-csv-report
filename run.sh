#!/bin/bash

set -e

case "$1" in
  build_generator)
    docker build -t csv-generator -f generator/Dockerfile .
    ;;

  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" csv-generator
    ;;

  create_local_data)
    mkdir -p local_data
    python3 generator/generate.py local_data
    ;;

  *)
    echo "Использование:"
    echo "./run.sh build_generator      # собрать образ генератора"
    echo "./run.sh run_generator        # запустить контейнер и создать data/data.csv"
    echo "./run.sh create_local_data    # создать local_data/data.csv локально"
    exit 1
    ;;
esac