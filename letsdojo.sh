#!/bin/sh
docker build --tag=letsdojoimage . 
docker run --name=letsdojocontainer -v `pwd`/app:/app --rm -d  letsdojoimage
docker exec -it letsdojocontainer composer install
docker exec -it letsdojocontainer bash