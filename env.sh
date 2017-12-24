#!/bin/bash

alias docker_project-db='docker exec -it jp-ten-db mysql -p -u root'
alias docker_project-dbdump='docker exec -it jp-ten-db mysqldump -p -u root your_database'

alias docker_project-dbbash='docker exec -it docker_project-db bash'
alias docker_project-webbash='docker exec -it docker_project-web bash'
