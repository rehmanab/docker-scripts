@echo off
IF %1.==. GOTO 10
set dockerContext=%1

GOTO START

:10
  ECHO Please add arg [default, dockerhost, etc]
  GOTO End1
GOTO START

:START
	ECHO Using "%dockerContext%" as docker context
	docker context use %dockerContext%
	ECHO Start compose up
	docker-compose -f .docker/docker-compose-aws.yml -p aws up -d
	docker-compose -f .docker/docker-compose-kafka.yml -p kafka up -d
	docker-compose -f .docker/docker-compose-pulsar.yml -p pulsar up -d
	docker-compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq up -d
	docker-compose -f .docker/docker-compose-azure.yml -p azure up -d

:End1

pause