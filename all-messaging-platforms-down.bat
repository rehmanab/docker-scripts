@echo off
IF %1.==. GOTO 10
set dockerContext=%1

GOTO START

:10
  ECHO Using default docker context...
  set dockerContext=default
GOTO START

:START
	ECHO Using "%dockerContext%" as docker context
	docker context use %dockerContext%
	ECHO Start compose down
	docker-compose -f .docker/docker-compose-aws.yml -p aws down
	docker-compose -f .docker/docker-compose-kafka.yml -p kafka down
	docker-compose -f .docker/docker-compose-pulsar.yml -p pulsar down
	docker-compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq down
	docker-compose -f .docker/docker-compose-azure.yml -p azure down

:End1

pause