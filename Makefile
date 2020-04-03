.PHONY: build

build:
	mkdir -p build
	git clone https://github.com/markphelps/flipt.git build/flipt || true
	cd build/flipt && git pull origin master
	python -m grpc_tools.protoc \
		-I ./build/flipt/rpc \
		--python_out=./lib/ \
		--grpc_python_out=./lib/ \
		./build/flipt/rpc/flipt.proto
