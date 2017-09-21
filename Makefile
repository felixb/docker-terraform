.PHONY: build

build: Dockerfile
	docker build --pull -t felixb/terraform .

push: build
	docker push felixb/terraform
