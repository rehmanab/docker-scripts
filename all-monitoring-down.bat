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
	docker-compose -f .docker/monitoring/docker-compose-seq.yml -p seq down
	docker-compose -f .docker/monitoring/docker-compose-jaeger.yml -p jaeger down

:End1

pause