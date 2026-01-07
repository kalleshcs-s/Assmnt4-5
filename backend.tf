terraform {
  backend "s3" {
    bucket         = "my-secure-tf-state1"
    key            = "env/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
