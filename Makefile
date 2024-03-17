postgres:
	docker run --name postgres16 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -p 5430:5432 -d postgres:16-alpine

createdb:
	docker exec -it postgres16 createdb --username=root --owner=root bank

dropdb:
	docker exec -it postgres16 dropdb bank

migrateup:
	migrate --path db/migration -database "postgresql://root:password@localhost:5430/bank?sslmode=disable" --verbose up

migratedown:
	migrate --path db/migration -database "postgresql://root:password@localhost:5430/bank?sslmode=disable" --verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc

