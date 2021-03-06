#!/bin/sh

path="$1"
force=false
while getopts 'f' opt
do
  case $opt in
    f) force=true
       path="$2" ;;
    ?) printf "Usage: $0: [-f] path\n"
       exit 1 ;;
  esac
done

if [ -z "$1" ];
then
  printf "Usage: $0 [-f] path\n"
  exit 1
fi
if ! $force && [ -d "$path" ];
then
  printf "Path $path already exists. Use -f flag to overwrite.\n"
  exit 1
fi

if $force;
then
  rm -rf $path/*
fi
cp -r . $path

rm -rf $path/data
rm -rf $path/orm
rm -rf `find $path -type d -name .svn`
rm -f $path/.gitignore
rm -f $path/private/logging_doc.txt
rm -f $path/private/parse.py
rm -f $path/make_web_install.sh
rm -f $path/README

mkdir $path/data
chmod 777 `find $path -type d`

printf "Finished copying to $path\n"
printf "Please set up private/config-template.php and rename to private/config.php\n"
