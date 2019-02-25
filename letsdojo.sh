#!/bin/sh
docker stop letsdojocontainer
docker build --tag=letsdojoimage . 
docker run --name=letsdojocontainer -v `pwd`/app:/app --rm -d -p 8000:8000 letsdojoimage
docker exec -it letsdojocontainer composer install
docker exec letsdojocontainer bash -c "php -S 0.0.0.0:8000 -t /app > /dev/null 2> /dev/null &" &
echo "\n\nTo access content through browser, go to http://localhost:8000\n\n"
docker exec -it letsdojocontainer bash