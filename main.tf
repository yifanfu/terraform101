provider "aws" {}

terraform {
  backend "s3" {
    bucket = "yifanfu"
    key    = "tfstate"
  }
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  name = "yifan-cluster"

  container_insights = true

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]

  tags = {
    Environment = "Development"
  }
}