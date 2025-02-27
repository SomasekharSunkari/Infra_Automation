resource "aws_s3_bucket" "backend_bucket" {
  bucket = "backendtf12"
  tags = {
    Name = "statebucket"
    env  = "dev"
  }
}
# }
# resource "aws_dynamodb_table" "terraformLockTable" {
#   name         = "terraformlocktable"
#   billing_mode = "PAY_PER_REQUEST"

#   hash_key = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   tags = {
#     Name = "lockTable"
#   }
# }
