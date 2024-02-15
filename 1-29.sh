#!/bin/bash

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Этот скрипт создаёт серию из N tar-архивов, где каждый следующий архив содержит предыдущий."
    echo "Использование: N={value} ./1-29.sh file [-h | --help]"
    exit 0
fi

if [ -z "$N" ]; then
  echo "Переменная N не задана"
  exit 1
fi
if [ -z "$1" ]; then
  echo "Путь к исходному файлу в качестве аргумента не задан"
  exit 2
fi

for((i=1;i<=$N;i++))
do
if [ $i -eq 1 ]; then
  tar -cf $i.tar $1
else
  tar -cf $i.tar $((i-1)).tar
fi
done
exit 0
