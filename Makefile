.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

clean:
	@docker-compose down --rmi all --volumes --remove-orphans

down:
	@docker compose down -v

dev:
	@docker compose up -d --build

phony:
	@echo $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')
