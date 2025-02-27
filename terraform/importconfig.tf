resource "aws_s3_bucket" "example" {
    bucket = "importbucket12"
}

import {
    id = "i-0bd46933a7cb8ff73"
    to = aws_instance.example
}