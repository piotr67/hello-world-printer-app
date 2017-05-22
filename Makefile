.PHONY: test deps

deps:
		pip install -r requirements.txt; \
		pip install -r test_requirements.txt

# pip install flake8

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello-world-printer .



USERNAME=piotr67
PASSWORD=pi@TrG669
TAG=$(USERNAME)/hello-world-printer
docker_push: docker_build
	docker login --username $(USERNAME) --password $(PASSWORD) ; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker loguot;
