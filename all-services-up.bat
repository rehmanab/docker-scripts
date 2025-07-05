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
	docker-compose -f .docker/docker-compose-redis.yml -p redis up -d
	docker-compose -f .docker/docker-compose-seq.yml -p seq up -d
	docker-compose -f .docker/docker-compose-jaeger.yml -p jaeger up -d

:End1

pause