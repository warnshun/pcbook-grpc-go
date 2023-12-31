run:
	go run main.go

server:
	go run cmd/server/main.go -port 8080

client:
	go run cmd/client/main.go -address 0.0.0.0:8080

gen:
	protoc --proto_path=proto proto/*.proto --go_out=./pb --go-grpc_out=./pb

clean:
	rm pb/*.go
	rm img/*

test:
	go test -cover -race ./...

cert:
	cd cert; ./gen.sh; cd ..

.PHONY: run server client gen clean test cert