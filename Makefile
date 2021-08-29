init:
	docker compose run --rm terraform init

plan:
	docker compose run --rm terraform plan

apply:
	docker compose run --rm terraform apply --auto-approve

destroy:
	docker compose run --rm terraform destroy --auto-approve