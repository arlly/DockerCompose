#!/bin/bash

alias docker_project-db='docker exec -it jp-ten-db mysql -p -u root'
alias docker_project-dbdump='docker exec -it jp-ten-db mysqldump -p -u root your_database'

alias jp-ten-dbbash='docker exec -it docker_project-db bash'
alias jp-ten-webbash='docker exec -it docker_project-web bash'
