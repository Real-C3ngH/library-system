# Convenience Makefile for local dev

.PHONY: docker-up docker-down docker-rebuild build clean

build:
	ant build

clean:
	ant clean

docker-up:
	cd docker && docker compose up -d --build

docker-down:
	cd docker && docker compose down

