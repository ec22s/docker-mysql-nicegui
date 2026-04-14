.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

clean:
	@docker-compose down --volumes && make prune

down:
	@docker compose down && make prune

dev:
	@docker compose up -d --build && make prune

prune:
	@docker image prune -f
