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
	ECHO Start compose up
	docker-compose -f .docker/caching/docker-compose-redis.yml -p redis up -d

:End1

pause