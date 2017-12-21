## DockerCompose

```
$ . env.sh
$ docker-compose build
$ docker-compose up -d
```

* 192.168.99.100
* 192.168.99.100:8080


## vim zip git composer など・・
```
apt-get install vim

apt-get install zip
apt-get install unzip

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

apt-get install git
```

## env.shのサンプル

```
#!/bin/bash

alias symfonydb='docker exec -it symfony-db mysql -p -u root'
alias symfonydbdump='docker exec -it symfony-db mysqldump -p -u root symfony_db'
alias symfonydbbash='docker exec -it symfony-db bash'
alias symfonywebbash='docker exec -it symfony-web bash'
alias symfonyconsole='docker exec -u www-data -it symfony-web /var/www/html/myapp/bin/console'
alias symfonytest='docker exec -u www-data -it symfony-web /var/app/vendor/bin/phpunit /var/www/html/myapp/tests'
```

ex
```
 symfonyconsole debug:container
 ```
