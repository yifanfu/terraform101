provider "aws" {}

terraform {
  backend "s3" {
    bucket = "yifanfu"
    key    = "tfstate"
  }
}

resource "random_string" "yifan_random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "aws_s3_bucket" "yifan_bucket" {
  bucket = "yifan-bucket-${random_string.yifan_random.result}"
  acl    = "private"

  depends_on = [
    random_string.yifan_random
  ]

  tags = {
    Name        = "yifan-bucket-${random_string.yifan_random.result}"
    Environment = var.Environment
  }
}

# module "ecs" {
#   source = "terraform-aws-modules/ecs/aws"

#   name = "yifan-cluster"

#   container_insights = true

#   capacity_providers = ["FARGATE", "FARGATE_SPOT"]

#   default_capacity_provider_strategy = [
#     {
#       capacity_provider = "FARGATE_SPOT"
#     }
#   ]

#   tags = {
#     Environment = var.Environment
#   }
# }
