.PHONY: test deps

deps:
		pip install -r requirements.txt; \
		pip install -r test_requirements.txt

# pip install flake8

lint:
	flake8 hello_world_ test

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello_world_printer .

USERNAME=piotr67
TAG=$(USERNAME)/hello-world-printer
docker_push:
	docker login --username $(USERNAME) --password $(PASSWORD) ; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker loguot;
