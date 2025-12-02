variable "roles" {
  type = map(object({ assume = string }))
  default = {
    "ci-role"     = { assume = "ec2.amazonaws.com" }
    "deploy-role" = { assume = "ecs-tasks.amazonaws.com" }
  }
}

resource "aws_iam_role" "role" {
  for_each = var.roles
  name     = each.key

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = each.value.assume }
    }]
  })
}
