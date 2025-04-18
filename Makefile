.PHONY: build clean test run-backend

build:
	cd frontend && ./gradlew build

clean:
	cd frontend && ./gradlew clean

test:
	cd frontend && ./gradlew test

run-backend:
	cd backend && docker-compose up --build

lint:
	cd frontend && ./gradlew ktlintCheck
