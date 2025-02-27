terraform {
   backend "s3" {
    bucket = "backendtf2"
    key = "devsecops/dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraformlocktable"
  }
}