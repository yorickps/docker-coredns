# makefile

pull :
	docker-compose pull 

up : pull 
	docker-compose up -d

down :
	docker-compose down

