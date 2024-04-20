# Makefile

.PHONY: dev-env dev-env.healthcheck dev-env.seed dev-env.clean dev-env.full dev-env.reset

dev-env:
	@echo "Starting development environment..."
	@docker-compose -f dev/env/docker-compose.yml up -d

dev-env.healthcheck:
	@echo "Checking the health of the development environment..."
	@docker-compose -f dev/env/docker-compose.yml ps
	@docker-compose -f dev/env/docker-compose.yml logs

dev-env.migrate:
	@echo "Migrating the database schemas..."
	@cat ./migrations/*.sql | docker exec -i $(shell docker-compose -f dev/env/docker-compose.yml ps -q postgres) psql -U devuser -d global_warfront

dev-env.seed:
	@echo "Seeding the database..."
	@cat ./seeds/*.sql | docker exec -i $(shell docker-compose -f dev/env/docker-compose.yml ps -q postgres) psql -U devuser -d global_warfront

dev-env.full: dev-env dev-env.healthcheck
	@sleep 2
	@make dev-env.migrate
	@make dev-env.seed

dev-env.reset: dev-env.clean dev-env.full

dev-env.clean:
	@echo "Cleaning up development environment..."
	@docker-compose -f dev/env/docker-compose.yml down -v

