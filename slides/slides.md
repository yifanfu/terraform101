---
theme: seriph
background: https://source.unsplash.com/collection/94734566/1920x1080
class: 'text-center'
highlighter: shiki
lineNumbers: false
---

# Terraform 101

---

# What are we going to cover today?

We are going to introduce some good things

- **Terraform** - Infrastructure as Code
- **3 Musketeers** - A universial way to test, build, deploy in the same way
- **GitHub Actions** - A powerful CI/CD tool to help you to spin up infrastructure or deploy apps

---

# Terraform - What is Infrastructure as Code

Infrastructure as Code is the process of managing and provisioning infrastructure using code instead of connecting physical hardwares.

<!-- note -->

---

# Terraform - IaC tools

- Provisioning tools:
  - Terraform
  - CloudFormation
- Configuration tools:
  - Ansible
  - Puppet
- Server Templating tools:
  - Docker
  - Vagrant

<!-- There are a lot more tools -->

---

# Terraform - Imperative vs. Declarative

### Imperative

We define the steps what need to be executed

### Declarative

We define the final state we desired

<!-- 
Imperative developer, Declarative product manager
-->

---

# Terraform - HCL (Hashicorp Configuration Language)

```hcl
resource "random_uuid" "yifan_random" {
}

resource "aws_s3_bucket" "yifan_bucket" {
  bucket = "yifan-bucket-${random_uuid.yifan_random.result}"
  acl    = "private"

  depends_on = [
    random_uuid.yifan_random
  ]

  tags = {
    Name        = "yifan-bucket-${random_uuid.yifan_random.result}"
    Environment = var.Environment
  }
}
```
```
<block_type> <resource_type> <resource_name> {
  <arguments>
}
```

---

# Terraform - Registry

- **Providers** - solution for different [cloud provider](https://registry.terraform.io/browse/providers)
- **Modules** - [common combination of resources](https://registry.terraform.io/browse/modules) for reusability 
- **Resources** - small component we can use for each provider

<!-- browse the web and explain the documentation sections -->

---

# Terraform - Deploy the stack

- `terraform init` - download all the resources needed
- `terraform plan` - display the plan to show what resources need to be changed
- `terraform apply` - deploy the terraform stack into cloud
- `terraform show` - show the resource created
- `terraform destroy` - remove the whole stack from cloud

[More details can be found here](https://www.terraform.io/docs/cli/commands/index.html)

<!-- there a lot more commands which we can't cover here -->

---

# 3 Musketeers - What are the 3 Musketeers?

- **Docker** - The environment that allow you to run the task
- **Compose** - Use docker compose so you don't have to type loooooong commnads
- **Make** - Makefile is like a recipt of all the tasks

---

# 3 Musketeers - Why would we use this?

- **Consistency** - Run the same commands no matter where you are: Linux, MacOS, Windows, CI/CD tools that supports Docker like GitHub Actions, Travis CI, CircleCI, and GitLab CI.
- **Control** - Take control of languages, versions, and tools you need, and version source control your pipelines with your preferred VCS like GitHub and GitLab.
- **Confidence** - Test your code and pipelines locally before your CI/CD tool runs it. Feel confident that if it works locally, it will work in your CI/CD server.

---

# 3 Musketeers - Let's look into details

[terraform101](https://github.com/yifanfu/terraform101)

---

# GitHub Actions - What is it?

GitHub Actions is an workflow that allows you to do the CI/CD for any project written in any language

---

# GitHub Actions - How do we configure it?

Let's look into the real example instead.
[workflow](https://github.com/yifanfu/terraform101/tree/master/.github/workflows)

<!--
explain each section
-->

---

# Source:

https://github.com/yifanfu/terraform101
