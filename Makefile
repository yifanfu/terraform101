init:
	docker-compose run --rm terraform init

plan:
	docker-compose run --rm terraform plan

output:
	docker-compose run --rm terraform output

apply:
	docker-compose run --rm terraform apply --auto-approve

destroy:
	docker-compose run --rm terraform destroy --auto-approve