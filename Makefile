TAG?=latest

image:
	cp ~/.ssh/id_rsa.pub ./
	docker build . -t usurper:$(TAG)

push-ecr:
	docker tag usurper:$(TAG) $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com/usurper:$(TAG)
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com/usurper:$(TAG)
